//
//  Terminal.m
//  iSH
//
//  Created by Theodore Dubois on 10/18/17.
//

#import "Terminal.h"
#import "DelayedUITask.h"

int write_function(void *cookie, const char *buf, int n) {
    Terminal *terminal = (__bridge Terminal *)(cookie);
    [terminal write:buf length:n];
    return 0;
}

@interface Terminal () <WKScriptMessageHandler> {
    NSLock *_dataLock;
    NSCondition *_dataConsumed;
}

@property WKWebView *webView;
@property BOOL loaded;
@property (nonatomic) NSMutableData *pendingData;
@property (nonatomic) BOOL processingPendingData;

@property DelayedUITask *refreshTask;
@property DelayedUITask *scrollToBottomTask;

@property BOOL applicationCursor;

@end

@interface CustomWebView : WKWebView
@end
@implementation CustomWebView
- (BOOL)becomeFirstResponder {
    if (@available(iOS 13.4, *)) {
        return [super becomeFirstResponder];
    }
    return NO;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(copy:) || action == @selector(paste:)) {
        return NO;
    }
    return [super canPerformAction:action withSender:sender];
}
@end

@implementation Terminal

- (instancetype)init {
    if (self = [super init]) {
        _wstream = fwopen((__bridge const void *)(self), write_function);

        self.pendingData = [NSMutableData new];
        self.refreshTask = [[DelayedUITask alloc] initWithTarget:self action:@selector(refresh)];
        self.scrollToBottomTask = [[DelayedUITask alloc] initWithTarget:self action:@selector(scrollToBottom)];
        _dataLock = [[NSLock alloc] init];
        _dataConsumed = [[NSCondition alloc] init];
        
        WKWebViewConfiguration *config = [WKWebViewConfiguration new];
        [config.userContentController addScriptMessageHandler:self name:@"load"];
        [config.userContentController addScriptMessageHandler:self name:@"log"];
        [config.userContentController addScriptMessageHandler:self name:@"sendInput"];
        [config.userContentController addScriptMessageHandler:self name:@"resize"];
        [config.userContentController addScriptMessageHandler:self name:@"propUpdate"];
        // Make the web view really big so that if a program tries to write to the terminal before it's displayed, the text probably won't wrap too badly.
        CGRect webviewSize = CGRectMake(0, 0, 10000, 10000);
        self.webView = [[CustomWebView alloc] initWithFrame:webviewSize configuration:config];
        self.webView.scrollView.scrollEnabled = NO;
        NSURL *xtermHtmlFile = [[NSBundle bundleForClass:[Terminal class]] URLForResource:@"term" withExtension:@"html"];
        [self.webView loadFileURL:xtermHtmlFile allowingReadAccessToURL:xtermHtmlFile];
    }
    return self;
}

- (void)dealloc {
    fclose(_wstream);
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"load"]) {
        self.loaded = YES;
        [self.refreshTask schedule];
        // make sure this setting works if it's set before loading
        self.enableVoiceOverAnnounce = self.enableVoiceOverAnnounce;
    } else if ([message.name isEqualToString:@"log"]) {
        NSLog(@"%@", message.body);
    } else if ([message.name isEqualToString:@"sendInput"]) {
        NSData *data = [message.body dataUsingEncoding:NSUTF8StringEncoding];
        [self sendInput:data.bytes length:data.length];
    } else if ([message.name isEqualToString:@"resize"]) {
        [self syncWindowSize];
    } else if ([message.name isEqualToString:@"propUpdate"]) {
        [self setValue:message.body[1] forKey:message.body[0]];
    }
}

- (void)syncWindowSize {
    [self.webView evaluateJavaScript:@"exports.getSize()" completionHandler:^(NSArray<NSNumber *> *dimensions, NSError *error) {
    }];
}

- (void)setEnableVoiceOverAnnounce:(BOOL)enableVoiceOverAnnounce {
    _enableVoiceOverAnnounce = enableVoiceOverAnnounce;
    [self.webView evaluateJavaScript:[NSString stringWithFormat:@"term.setAccessibilityEnabled(%@)",
                                      enableVoiceOverAnnounce ? @"true" : @"false"]
                   completionHandler:nil];
}

- (int)write:(const void *)buf length:(size_t)len {
    [_dataLock lock];
//    if (!NSThread.isMainThread) {
//        // The main thread is the only one that can unblock this, so sleeping here would be a deadlock.
//        // The only reason for this to be called on the main thread is if input is echoed.
//        while (_processingPendingData || _pendingData.length > 10000)
//            [_dataConsumed wait];
//    }
    [self.pendingData appendData:[NSData dataWithBytes:buf length:len]];
    [self.refreshTask schedule];
    [_dataLock unlock];
    return 0;
}

- (void)sendInput:(const char *)buf length:(size_t)len {
//    parse_console(buf);
    [self.webView evaluateJavaScript:@"exports.setUserGesture()" completionHandler:nil];
    [self.scrollToBottomTask schedule];
}

- (void)scrollToBottom {
    [self.webView evaluateJavaScript:@"exports.scrollToBottom()" completionHandler:nil];
}

- (NSString *)arrow:(char)direction {
    return [NSString stringWithFormat:@"\x1b%c%c", self.applicationCursor ? 'O' : '[', direction];
}

- (void)refresh {
    if (!self.loaded)
        return;

    [_dataLock lock];
    if (_processingPendingData) {
        [_dataLock unlock];
        [self.refreshTask schedule];
        return;
    }
    NSData *data = self.pendingData;
    _pendingData = [NSMutableData new];;
    _processingPendingData = YES;
    [_dataLock unlock];

    NSString *dataString = [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSISOLatin1StringEncoding];
    // escape for javascript. only have to worry about the first 256 codepoints, because of the latin-1 encoding.
    dataString = [dataString stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
    dataString = [dataString stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"];
    dataString = [dataString stringByReplacingOccurrencesOfString:@"\n" withString:@"\\r\\n"];
    dataString = [dataString stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *jsToEvaluate = [NSString stringWithFormat:@"exports.write(\"%@\")", dataString];
    [self.webView evaluateJavaScript:jsToEvaluate completionHandler:^(id result, NSError *error) {
        [self->_dataLock lock];
        self->_processingPendingData = NO;
        [self->_dataConsumed broadcast];
        [self->_dataLock unlock];
        if (error != nil) {
            NSLog(@"error sending bytes to the terminal: %@", error);
            return;
        }
    }];
}

@end
