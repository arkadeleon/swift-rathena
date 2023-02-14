//
//  RALoginServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

typedef void (^RALoginServerOutputHandler)(NSData * _Nonnull data);
typedef void (^RALoginServerDataReceiveHandler)(NSData * _Nonnull data);
typedef void (^RALoginServerDataSendHandler)(NSData * _Nonnull data);

@interface RALoginServer : NSThread

@property (nonatomic, copy) RALoginServerOutputHandler _Nullable outputHandler;
@property (nonatomic, copy) RALoginServerDataReceiveHandler _Nullable dataReceiveHandler;
@property (nonatomic, copy) RALoginServerDataSendHandler _Nullable dataSendHandler;

@end
