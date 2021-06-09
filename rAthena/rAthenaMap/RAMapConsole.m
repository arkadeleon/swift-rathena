//
//  RAMapConsole.m
//  rAthenaMap
//
//  Created by Leon Li on 2021/6/8.
//

#import "RAMapConsole.h"

@implementation RAMapConsole

- (void)write:(NSString *)text {
    if (self.writeHandler) {
        self.writeHandler(text);
    }
}

@end
