//
//  RAWebServer.h
//  rAthena
//
//  Created by Leon Li on 2022/11/1.
//

#import <Foundation/Foundation.h>

typedef void (^RAWebServerOutputHandler)(NSData * _Nonnull data);
typedef void (^RAWebServerDataReceiveHandler)(NSData * _Nonnull data);
typedef void (^RAWebServerDataSendHandler)(NSData * _Nonnull data);

@interface RAWebServer : NSThread

@property (nonatomic, copy) RAWebServerOutputHandler _Nullable outputHandler;
@property (nonatomic, copy) RAWebServerDataReceiveHandler _Nullable dataReceiveHandler;
@property (nonatomic, copy) RAWebServerDataSendHandler _Nullable dataSendHandler;

@end
