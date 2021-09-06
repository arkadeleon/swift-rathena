//
//  Terminal.h
//  iSH
//
//  Created by Theodore Dubois on 10/18/17.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface Terminal : NSObject

- (int)write:(NSData *)buf;
- (void)sendInput:(const char *)buf length:(size_t)len;
- (void)clear;

@property (readonly) WKWebView *webView;
// Use KVO on this
@property (readonly) BOOL loaded;

@end
