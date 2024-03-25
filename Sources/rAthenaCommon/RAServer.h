//
//  RAServer.h
//  rAthena
//
//  Created by Leon Li on 2023/2/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RAServerStatus) {
    RAServerStatusNotStarted,
    RAServerStatusStarting,
    RAServerStatusRunning,
    RAServerStatusStopping,
    RAServerStatusStopped,
};

typedef void (^RAServerOutputHandler)(NSData *data);

@interface RAServer : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) RAServerStatus status;

@property (nonatomic, copy, nullable) RAServerOutputHandler outputHandler;

- (void)startWithCompletionHandler:(void (^)(BOOL))completionHandler NS_SWIFT_ASYNC(1);
- (void)stopWithCompletionHandler:(void (^)(BOOL))completionHandler NS_SWIFT_ASYNC(1);

@end

NS_ASSUME_NONNULL_END
