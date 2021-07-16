//
//  ServerManager.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, ServerMask) {
    ServerMaskChar = (1 << 0),
    ServerMaskLogin = (1 << 1),
    ServerMaskMap = (1 << 2),
};

@interface ServerManager : NSObject

@property (class, nonatomic, readonly) ServerManager *sharedManager;

- (NSString *)nameForServer:(ServerMask)server;
- (UIView *)terminalViewForServer:(ServerMask)server;

- (void)startServers:(ServerMask)servers;
- (void)clearTerminalForServers:(ServerMask)servers;

- (void)copyBundleResourcesAndChangeDirectory;

@end

NS_ASSUME_NONNULL_END
