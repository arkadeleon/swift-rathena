//
//  TerminalView.m
//  iSH
//
//  Created by Theodore Dubois on 11/3/17.
//

#import "ScrollbarView.h"
#import "TerminalView.h"

@interface TerminalView ()

@property ScrollbarView *scrollbarView;

@end

@implementation TerminalView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    self.backgroundColor = UIColor.systemBackgroundColor;

    ScrollbarView *scrollbarView = self.scrollbarView = [[ScrollbarView alloc] initWithFrame:self.bounds];
    self.scrollbarView = scrollbarView;
    scrollbarView.delegate = self;
    scrollbarView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    scrollbarView.bounces = NO;
    [self addSubview:scrollbarView];

    self.terminal = [Terminal new];

    return self;
}

- (void)dealloc {
    self.terminal = nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (object == self.terminal) {
        if (self.terminal.loaded) {
            [self _updateStyle];
        }
    }
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (self.traitCollection.userInterfaceStyle != previousTraitCollection.userInterfaceStyle) {
        [self _updateStyle];
    }
}

- (void)setTerminal:(Terminal *)terminal {
    NSArray<NSString *>* handlers = @[@"newScrollHeight", @"newScrollTop", @"openLink"];
    
    if (self.terminal) {
        // remove old terminal
        NSAssert(self.terminal.webView.superview == self.scrollbarView, @"old terminal view was not in our view");
        [self.terminal.webView removeFromSuperview];
        self.scrollbarView.contentView = nil;
        for (NSString *handler in handlers) {
            [self.terminal.webView.configuration.userContentController removeScriptMessageHandlerForName:handler];
        }
        [self.terminal removeObserver:self forKeyPath:@"loaded"];
    }
    
    _terminal = terminal;
    WKWebView *webView = terminal.webView;
    webView.scrollView.scrollEnabled = NO;
    webView.scrollView.delaysContentTouches = NO;
    webView.scrollView.canCancelContentTouches = NO;
    webView.scrollView.panGestureRecognizer.enabled = NO;
    for (NSString *handler in handlers) {
        [webView.configuration.userContentController addScriptMessageHandler:self name:handler];
    }
    webView.frame = self.bounds;
    self.opaque = webView.opaque = NO;
    webView.backgroundColor = UIColor.clearColor;
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.terminal addObserver:self forKeyPath:@"loaded" options:NSKeyValueObservingOptionInitial context:nil];
    
    self.scrollbarView.contentView = webView;
    [self.scrollbarView addSubview:webView];
}

#pragma mark Styling

- (NSString *)cssColor:(UIColor *)color {
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    return [NSString stringWithFormat:@"rgba(%ld, %ld, %ld, %ld)",
            lround(red * 255), lround(green * 255), lround(blue * 255), lround(alpha * 255)];
}

- (void)_updateStyle {
    if (!self.terminal.loaded)
        return;
    id themeInfo = @{
        @"fontFamily": @"Menlo",
        @"fontSize": @(12),
        @"foregroundColor": [self cssColor:UIColor.labelColor],
        @"backgroundColor": [self cssColor:UIColor.systemBackgroundColor],
    };
    NSString *json = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:themeInfo options:0 error:nil] encoding:NSUTF8StringEncoding];
    [self.terminal.webView evaluateJavaScript:[NSString stringWithFormat:@"exports.updateStyle(%@)", json] completionHandler:nil];
}

#pragma mark Scrolling

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"newScrollHeight"]) {
        self.scrollbarView.contentSize = CGSizeMake(0, [message.body doubleValue]);
    } else if ([message.name isEqualToString:@"newScrollTop"]) {
        CGFloat newOffset = [message.body doubleValue];
        if (self.scrollbarView.contentOffset.y == newOffset)
            return;
        [self.scrollbarView setContentOffset:CGPointMake(0, newOffset) animated:NO];
    } else if ([message.name isEqualToString:@"openLink"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:message.body] options:@{} completionHandler:nil];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.terminal.webView evaluateJavaScript:[NSString stringWithFormat:@"exports.newScrollTop(%f)", scrollView.contentOffset.y] completionHandler:nil];
}

@end
