//
//  LoginServerHandlers.h
//  rAthenaChar
//
//  Created by Leon Li on 2021/9/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^LoginServerOutputHandler)(NSData *buffer);
typedef void (^LoginServerDataReceiveHandler)(NSData *data);
typedef void (^LoginServerDataSendHandler)(NSData *data);

@interface LoginServerHandlers : NSObject

@property (class, nonatomic, readonly) LoginServerHandlers *sharedHandlers;

@property (nonatomic, copy) LoginServerOutputHandler outputHandler;
@property (nonatomic, copy) LoginServerDataReceiveHandler dataReceiveHandler;
@property (nonatomic, copy) LoginServerDataSendHandler dataSendHandler;

@end

NS_ASSUME_NONNULL_END
