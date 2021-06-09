//
//  RACharConsole.m
//  rAthenaChar
//
//  Created by Leon Li on 2021/6/8.
//

#import "RACharConsole.h"

@implementation RACharConsole

- (void)write:(NSString *)text {
    if (self.writeHandler) {
        self.writeHandler(text);
    }
}

@end
