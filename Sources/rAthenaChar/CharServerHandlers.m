//
//  CharServerHandlers.m
//  rAthenaChar
//
//  Created by Leon Li on 2021/9/6.
//

#import "CharServerHandlers.h"

@implementation CharServerHandlers

+ (CharServerHandlers *)sharedHandlers {
    static CharServerHandlers *handlers = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handlers = [[CharServerHandlers alloc] init];
    });
    return handlers;
}

@end
