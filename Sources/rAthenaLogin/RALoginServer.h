//
//  RALoginServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

@import rAthenaCommon;

NS_ASSUME_NONNULL_BEGIN

@interface RALoginServer : RAServer

@property (nonatomic, class, readonly) RALoginServer *sharedServer;

@end

NS_ASSUME_NONNULL_END
