//
//  LoginServerHandlers.m
//  rAthenaChar
//
//  Created by Leon Li on 2021/9/6.
//

#import "LoginServerHandlers.h"

@implementation LoginServerHandlers

+ (LoginServerHandlers *)sharedHandlers {
    static LoginServerHandlers *handlers = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handlers = [[LoginServerHandlers alloc] init];
    });
    return handlers;
}

@end
