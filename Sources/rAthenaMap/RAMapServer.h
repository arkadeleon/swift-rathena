//
//  RAMapServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

typedef void (^RAMapServerOutputHandler)(NSData * _Nonnull data);
typedef void (^RAMapServerDataReceiveHandler)(NSData * _Nonnull data);
typedef void (^RAMapServerDataSendHandler)(NSData * _Nonnull data);

@interface RAMapServer : NSThread

@property (nonatomic, copy) RAMapServerOutputHandler _Nullable outputHandler;
@property (nonatomic, copy) RAMapServerDataReceiveHandler _Nullable dataReceiveHandler;
@property (nonatomic, copy) RAMapServerDataSendHandler _Nullable dataSendHandler;

@end
