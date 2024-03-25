//
//  LoginServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import <rAthenaCommon.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginServer : Server

@property (nonatomic, class, readonly) LoginServer *sharedServer;

@end

NS_ASSUME_NONNULL_END
