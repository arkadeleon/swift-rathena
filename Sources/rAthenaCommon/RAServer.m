//
//  RAServer.m
//  rAthena
//
//  Created by Leon Li on 2023/2/14.
//

#import "RAServer.h"
#import "RAServerPrivate.h"

@implementation RAServer

- (instancetype)init {
    self = [super init];
    if (self) {
        _status = RAServerStatusNotStarted;
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
