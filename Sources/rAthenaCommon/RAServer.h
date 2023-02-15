//
//  RAServer.h
//  rAthena
//
//  Created by Leon Li on 2023/2/14.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RAServerStatus) {
    RAServerStatusNotStarted,
    RAServerStatusInitializing,
    RAServerStatusInitialized,
    RAServerStatusRunning,
    RAServerStatusStopping,
    RAServerStatusFinalizing,
    RAServerStatusFinalized,
    RAServerStatusStopped,
};

typedef NS_ENUM(NSInteger, RAServerType) {
    RAServerTypeLogin,
    RAServerTypeChar,
    RAServerTypeMap,
    RAServerTypeWeb,
};

typedef void (^RAServerOutputHandler)(NSData * _Nonnull data);
typedef void (^RAServerDataReceiveHandler)(NSData * _Nonnull data);
typedef void (^RAServerDataSendHandler)(NSData * _Nonnull data);

@interface RAServer : NSObject

@property (nonatomic, readonly, copy) NSString * _Nonnull name;
@property (nonatomic, readonly, assign) RAServerStatus status;

@property (nonatomic, copy) RAServerOutputHandler _Nullable outputHandler;
@property (nonatomic, copy) RAServerDataReceiveHandler _Nullable dataReceiveHandler;
@property (nonatomic, copy) RAServerDataSendHandler _Nullable dataSendHandler;

- (void)start;
- (void)stop;

@end
