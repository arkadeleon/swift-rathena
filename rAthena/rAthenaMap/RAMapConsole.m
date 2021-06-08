//
//  RAMapConsole.m
//  rAthenaMap
//
//  Created by Leon Li on 2021/6/8.
//

#import "RAMapConsole.h"

@interface RAMapConsole ()

@property (nonatomic, readwrite, copy) NSString *buffer;

@end

@implementation RAMapConsole

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
