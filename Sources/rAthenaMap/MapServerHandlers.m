//
//  MapServerHandlers.m
//  rAthenaMap
//
//  Created by Leon Li on 2021/9/6.
//

#import "MapServerHandlers.h"

@implementation MapServerHandlers

+ (MapServerHandlers *)sharedHandlers {
    static MapServerHandlers *handlers = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handlers = [[MapServerHandlers alloc] init];
    });
    return handlers;
}

@end
