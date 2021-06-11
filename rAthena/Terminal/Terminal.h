//
//  Terminal.h
//  iSH
//
//  Created by Theodore Dubois on 10/18/17.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface Terminal : NSObject

@property (nonatomic, readonly, assign) FILE *wstream;

- (int)write:(const void *)buf length:(size_t)len;
- (void)sendInput:(const char *)buf length:(size_t)len;

- (NSString *)arrow:(char)direction;

@property (readonly) WKWebView *webView;
@property (nonatomic) BOOL enableVoiceOverAnnounce;
// Use KVO on this
@property (readonly) BOOL loaded;

@end
