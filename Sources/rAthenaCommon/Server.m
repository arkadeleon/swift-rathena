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
}

- (void)stopWithCompletionHandler:(void (^)(BOOL))completionHandler {
}

@end
