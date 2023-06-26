//
//  RAServer.h
//  rAthena
//
//  Created by Leon Li on 2023/2/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RAServerType) {
    RAServerTypeLogin,
    RAServerTypeChar,
    RAServerTypeMap,
    RAServerTypeWeb,
};

typedef NS_ENUM(NSInteger, RAServerStatus) {
    RAServerStatusNotStarted,
    RAServerStatusStarting,
    RAServerStatusRunning,
    RAServerStatusStopping,
    RAServerStatusStopped,
};

typedef void (^RAServerOutputHandler)(NSData *data);
typedef void (^RAServerDataReceiveHandler)(NSData *data);
typedef void (^RAServerDataSendHandler)(NSData *data);

@interface RAServer : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) RAServerStatus status;

@property (nonatomic, copy, nullable) RAServerOutputHandler outputHandler;
@property (nonatomic, copy, nullable) RAServerDataReceiveHandler dataReceiveHandler;
@property (nonatomic, copy, nullable) RAServerDataSendHandler dataSendHandler;

- (void)start;
- (void)stop;

@end

NS_ASSUME_NONNULL_END
