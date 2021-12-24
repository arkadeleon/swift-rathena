//
//  LoginServerHandlers.h
//  rAthenaChar
//
//  Created by Leon Li on 2021/9/6.
//

#import <Foundation/Foundation.h>

typedef void (^LoginServerOutputHandler)(NSData * _Nonnull buffer);
typedef void (^LoginServerDataReceiveHandler)(NSData * _Nonnull data);
typedef void (^LoginServerDataSendHandler)(NSData * _Nonnull data);

@interface LoginServerHandlers : NSObject

@property (class, nonatomic, readonly) LoginServerHandlers * _Nonnull sharedHandlers;

@property (nonatomic, copy) LoginServerOutputHandler _Nullable outputHandler;
@property (nonatomic, copy) LoginServerDataReceiveHandler _Nullable dataReceiveHandler;
@property (nonatomic, copy) LoginServerDataSendHandler _Nullable dataSendHandler;

@end
