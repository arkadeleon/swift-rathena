//
//  RAServerManager.h
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

@import rAthenaChar;
@import rAthenaLogin;
@import rAthenaMap;

NS_ASSUME_NONNULL_BEGIN

@interface RAServerManager : NSObject

@property (class, nonatomic, readonly) RAServerManager *sharedManager;

@property (nonatomic, readonly, strong) RACharServer *charServer;
@property (nonatomic, readonly, strong) RALoginServer *loginServer;
@property (nonatomic, readonly, strong) RAMapServer *mapServer;

- (void)copyBundleResourcesAndChangeDirectory;

@end

NS_ASSUME_NONNULL_END
