//
//  RAMapServer.m
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import "RAMapServer.h"
#import "RAMapConsole.h"
#include "showmsg.hpp"

extern int main (int argc, char **argv);

int console_write(void *cookie, const char *buf, int n) {
    RAMapConsole *console = (__bridge RAMapConsole *)(cookie);
    NSString *buffer = [NSString stringWithUTF8String:buf];
    [console write:buffer];
    return 0;
}

@implementation RAMapServer

- (instancetype)init {
    self = [super init];
    if (self) {
        _console = [[RAMapConsole alloc] init];
    }
    return self;
}

- (void)main {
    FILE *f = fwopen((__bridge const void *)(self.console), console_write);
    STDOUT = f;
    STDERR = f;

    char *arg0 = "Map-Server";
    char *args[1] = {arg0};
    main(1, args);

    fclose(f);
}

@end
