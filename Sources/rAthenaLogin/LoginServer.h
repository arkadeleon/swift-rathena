//
//  LoginServer.h
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

typedef void (^LoginServerOutputHandler)(NSData * _Nonnull data);
typedef void (^LoginServerDataReceiveHandler)(NSData * _Nonnull data);
typedef void (^LoginServerDataSendHandler)(NSData * _Nonnull data);

@interface LoginServer : NSThread

@property (nonatomic, copy) LoginServerOutputHandler _Nullable outputHandler;
@property (nonatomic, copy) LoginServerDataReceiveHandler _Nullable dataReceiveHandler;
@property (nonatomic, copy) LoginServerDataSendHandler _Nullable dataSendHandler;

@end
