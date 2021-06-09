//
//  RALoginConsole.m
//  rAthenaLogin
//
//  Created by Leon Li on 2021/6/8.
//

#import "RALoginConsole.h"

@implementation RALoginConsole

- (void)write:(NSString *)text {
    if (self.writeHandler) {
        self.writeHandler(text);
    }
}

@end
