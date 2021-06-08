//
//  RALoginServer.m
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import "RALoginServer.h"
#import "RALoginConsole.h"
#include "showmsg.hpp"

extern int main (int argc, char **argv);

int console_write(void *cookie, const char *buf, int n) {
    RALoginConsole *console = (__bridge RALoginConsole *)(cookie);
    NSString *buffer = [NSString stringWithUTF8String:buf];
    [console write:buffer];
    return 0;
}

@implementation RALoginServer

- (instancetype)init {
    self = [super init];
    if (self) {
        _console = [[RALoginConsole alloc] init];
    }
    return self;
}

- (void)main {
    FILE *f = fwopen((__bridge const void *)(self.console), console_write);
    STDOUT = f;
    STDERR = f;

    char *arg0 = "Login-Server";
    char *args[1] = {arg0};
    main(1, args);

    fclose(f);
}

@end
