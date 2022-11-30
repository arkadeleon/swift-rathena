//
//  WebServer.h
//  rAthena
//
//  Created by Leon Li on 2022/11/1.
//

#import <Foundation/Foundation.h>

typedef void (^WebServerOutputHandler)(NSData * _Nonnull data);
typedef void (^WebServerDataReceiveHandler)(NSData * _Nonnull data);
typedef void (^WebServerDataSendHandler)(NSData * _Nonnull data);

@interface WebServer : NSThread

@property (nonatomic, copy) WebServerOutputHandler _Nullable outputHandler;
@property (nonatomic, copy) WebServerDataReceiveHandler _Nullable dataReceiveHandler;
@property (nonatomic, copy) WebServerDataSendHandler _Nullable dataSendHandler;

@end
