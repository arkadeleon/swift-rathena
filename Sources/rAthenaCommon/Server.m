//
//  Server.m
//  rAthena
//
//  Created by Leon Li on 2023/2/14.
//

#import "Server.h"
#import "ServerPrivate.h"

@implementation Server

- (instancetype)init {
    self = [super init];
    if (self) {
        _status = ServerStatusNotStarted;
    }
    return self;
}

- (NSString *)name {
    return @"";
}

- (void)startWithCompletionHandler:(void (^)(BOOL))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.status != ServerStatusNotStarted && self.status != ServerStatusStopped) {
            completionHandler(NO);
            return;
        }

        self.status = ServerStatusStarting;

        [self start];

        self.status = ServerStatusRunning;

        completionHandler(YES);
    });
}

- (void)stopWithCompletionHandler:(void (^)(BOOL))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.status != ServerStatusRunning) {
            completionHandler(NO);
            return;
        }

        self.status = ServerStatusStopping;

        [self stop];

        self.status = ServerStatusStopped;

        completionHandler(YES);
    });
}

- (void)start {
}

- (void)stop {
}

@end
