//
//  Server.m
//  rAthena
//
//  Created by Leon Li on 2023/2/14.
//

#import "Server.h"
#import "ServerPrivate.h"

NSNotificationName const ServerDidOutputDataNotification = @"ServerDidOutputDataNotification";
NSString * const ServerOutputDataKey = @"ServerOutputDataKey";

@implementation Server

- (instancetype)init {
    self = [super init];
    if (self) {
        _status = ServerStatusNotStarted;

        _startStopQueue = dispatch_queue_create("com.github.arkadeleon.swift-rathena.server.start-stop", DISPATCH_QUEUE_SERIAL);
        _outputQueue = dispatch_queue_create("com.github.arkadeleon.swift-rathena.server.output", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (NSString *)name {
    return @"Server";
}

- (void)startWithCompletionHandler:(void (^)(BOOL))completionHandler {
    dispatch_async(self.startStopQueue, ^{
        if (self.status != ServerStatusNotStarted && self.status != ServerStatusStopped) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(NO);
            });
            return;
        }

        self.status = ServerStatusStarting;

        [self start];

        self.status = ServerStatusRunning;

        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(YES);
        });
    });
}

- (void)stopWithCompletionHandler:(void (^)(BOOL))completionHandler {
    dispatch_async(self.startStopQueue, ^{
        if (self.status != ServerStatusRunning) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(NO);
            });
            return;
        }

        self.status = ServerStatusStopping;

        [self stop];

        self.status = ServerStatusStopped;

        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(YES);
        });
    });
}

- (void)start {
}

- (void)stop {
}

@end
