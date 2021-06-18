//
//  RAServerManager.h
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, RAServerMask) {
    RAServerMaskChar = (1 << 0),
    RAServerMaskLogin = (1 << 1),
    RAServerMaskMap = (1 << 2),
};

@interface RAServerManager : NSObject

@property (class, nonatomic, readonly) RAServerManager *sharedManager;

- (NSString *)nameForServer:(RAServerMask)server;
- (UIView *)terminalViewForServer:(RAServerMask)server;

- (void)startServers:(RAServerMask)servers;
- (void)clearTerminalForServers:(RAServerMask)servers;

- (void)copyBundleResourcesAndChangeDirectory;

@end

NS_ASSUME_NONNULL_END
