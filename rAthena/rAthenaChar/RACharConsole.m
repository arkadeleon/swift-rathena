//
//  RACharConsole.m
//  rAthenaChar
//
//  Created by Leon Li on 2021/6/8.
//

#import "RACharConsole.h"

@interface RACharConsole ()

@property (nonatomic, readwrite, copy) NSString *buffer;

@end

@implementation RACharConsole

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
