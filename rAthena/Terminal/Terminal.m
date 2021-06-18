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
}

@property WKWebView *webView;
@property BOOL loaded;
@property (nonatomic) NSMutableData *pendingData;
@property (nonatomic) BOOL processingPendingData;

@property DelayedUITask *refreshTask;
@property DelayedUITask *scrollToBottomTask;

@end

@implementation Terminal

- (instancetype)init {
    if (self = [super init]) {
        _output = fwopen((__bridge const void *)(self), write_function);

        self.pendingData = [NSMutableData new];
        self.refreshTask = [[DelayedUITask alloc] initWithTarget:self action:@selector(refresh)];
        self.scrollToBottomTask = [[DelayedUITask alloc] initWithTarget:self action:@selector(scrollToBottom)];
        _dataLock = [[NSLock alloc] init];
        
        WKWebViewConfiguration *config = [WKWebViewConfiguration new];
        [config.userContentController addScriptMessageHandler:self name:@"load"];
        [config.userContentController addScriptMessageHandler:self name:@"log"];
        [config.userContentController addScriptMessageHandler:self name:@"sendInput"];
        // Make the web view really big so that if a program tries to write to the terminal before it's displayed, the text probably won't wrap too badly.
        CGRect webviewSize = CGRectMake(0, 0, 10000, 10000);
        self.webView = [[WKWebView alloc] initWithFrame:webviewSize configuration:config];
        self.webView.scrollView.scrollEnabled = NO;
        NSURL *xtermHtmlFile = [[NSBundle bundleForClass:[Terminal class]] URLForResource:@"term" withExtension:@"html"];
        [self.webView loadFileURL:xtermHtmlFile allowingReadAccessToURL:xtermHtmlFile];
    }
    return self;
}

- (void)dealloc {
    fclose(_output);
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"load"]) {
        self.loaded = YES;
        [self.refreshTask schedule];
    } else if ([message.name isEqualToString:@"log"]) {
        NSLog(@"%@", message.body);
    } else if ([message.name isEqualToString:@"sendInput"]) {
        NSData *data = [message.body dataUsingEncoding:NSUTF8StringEncoding];
        [self sendInput:data.bytes length:data.length];
    }
}

- (int)write:(const void *)buf length:(size_t)len {
    [_dataLock lock];
    [self.pendingData appendData:[NSData dataWithBytes:buf length:len]];
    [self.refreshTask schedule];
    [_dataLock unlock];
    return 0;
}

- (void)sendInput:(const char *)buf length:(size_t)len {
    [self.webView evaluateJavaScript:@"exports.setUserGesture()" completionHandler:nil];
    [self.scrollToBottomTask schedule];
}

- (void)clear {
    [self.webView evaluateJavaScript:@"term.wipeContents()" completionHandler:nil];
    [self.scrollToBottomTask schedule];
}

- (void)scrollToBottom {
    [self.webView evaluateJavaScript:@"exports.scrollToBottom()" completionHandler:nil];
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
        [self->_dataLock unlock];
        if (error != nil) {
            NSLog(@"error sending bytes to the terminal: %@", error);
            return;
        }
    }];
}

@end
