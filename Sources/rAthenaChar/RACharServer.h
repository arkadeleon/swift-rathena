//
//  RACharServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

typedef void (^RACharServerOutputHandler)(NSData * _Nonnull data);
typedef void (^RACharServerDataReceiveHandler)(NSData * _Nonnull data);
typedef void (^RACharServerDataSendHandler)(NSData * _Nonnull data);

@interface RACharServer : NSThread

@property (nonatomic, copy) RACharServerOutputHandler _Nullable outputHandler;
@property (nonatomic, copy) RACharServerDataReceiveHandler _Nullable dataReceiveHandler;
@property (nonatomic, copy) RACharServerDataSendHandler _Nullable dataSendHandler;

@end
