//
//  RALoginConsole.m
//  rAthenaLogin
//
//  Created by Leon Li on 2021/6/8.
//

#import "RALoginConsole.h"

@interface RALoginConsole ()

@property (nonatomic, readwrite, copy) NSString *buffer;

@end

@implementation RALoginConsole

- (instancetype)init {
    self = [super init];
    if (self) {
        _buffer = [NSString string];
    }
    return self;
}

- (void)write:(NSString *)buffer {
    self.buffer = [self.buffer stringByAppendingString:buffer];
}

@end
