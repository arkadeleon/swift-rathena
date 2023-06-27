//
//  RAItem2.m
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import "RAItem2.h"

@implementation RAItem2

- (instancetype)init {
    self = [super init];
    if (self) {
        _flags = [[RAItemFlags2 alloc] init];
        _delay = [[RAItemDelay2 alloc] init];
        _stack = [[RAItemStack2 alloc] init];
        _noUse = [[RAItemNoUse2 alloc] init];
        _trade = [[RAItemTrade2 alloc] init];
    }
    return self;
}

@end

@implementation RAItemFlags2

@end

@implementation RAItemDelay2

@end

@implementation RAItemStack2

@end

@implementation RAItemNoUse2

@end

@implementation RAItemTrade2

@end
