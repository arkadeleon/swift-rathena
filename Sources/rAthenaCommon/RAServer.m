//
//  RAServer.m
//  rAthena
//
//  Created by Leon Li on 2023/2/14.
//

#import "RAServer.h"

@implementation RAServer

- (NSString *)name {
    return @"";
}

- (RAServerStatus)status {
    return RAServerStatusNotStarted;
}

- (void)startWithCompletionHandler:(void (^)(BOOL))completionHandler {
}

- (void)stopWithCompletionHandler:(void (^)(BOOL))completionHandler {
}

@end
