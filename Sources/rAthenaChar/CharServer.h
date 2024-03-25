//
//  CharServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import <rAthenaCommon.h>

NS_ASSUME_NONNULL_BEGIN

@interface CharServer : Server

@property (nonatomic, class, readonly) CharServer *sharedServer;

@end

NS_ASSUME_NONNULL_END
