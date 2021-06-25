//
//  Terminal.h
//  iSH
//
//  Created by Theodore Dubois on 10/18/17.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface Terminal : NSObject

@property (nonatomic, readonly, assign) FILE *output;

- (int)write:(const void *)buf length:(size_t)len;
- (void)sendInput:(const char *)buf length:(size_t)len;
- (void)clear;

@property (readonly) WKWebView *webView;
// Use KVO on this
@property (readonly) BOOL loaded;

@end
