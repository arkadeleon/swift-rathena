//
//  Server.h
//  rAthena
//
//  Created by Leon Li on 2023/2/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ServerStatus) {
    ServerStatusNotStarted,
    ServerStatusStarting,
    ServerStatusRunning,
    ServerStatusStopping,
    ServerStatusStopped,
};

typedef void (^ServerOutputHandler)(NSData *data);

@interface Server : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) ServerStatus status;

@property (nonatomic, copy, nullable) ServerOutputHandler outputHandler;

- (void)startWithCompletionHandler:(void (^)(BOOL))completionHandler NS_SWIFT_ASYNC(1);
- (void)stopWithCompletionHandler:(void (^)(BOOL))completionHandler NS_SWIFT_ASYNC(1);

@end

NS_ASSUME_NONNULL_END
