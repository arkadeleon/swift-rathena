//
//  RACharServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import <rAthenaCommon.h>

NS_ASSUME_NONNULL_BEGIN

@interface RACharServer : RAServer

@property (nonatomic, class, readonly) RACharServer *sharedServer;

@end

NS_ASSUME_NONNULL_END
