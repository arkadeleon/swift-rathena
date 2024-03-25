//
//  WebServer.h
//  rAthena
//
//  Created by Leon Li on 2022/11/1.
//

#import <Foundation/Foundation.h>
#import <rAthenaCommon.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebServer : Server

@property (nonatomic, class, readonly) WebServer *sharedServer;

@end

NS_ASSUME_NONNULL_END
