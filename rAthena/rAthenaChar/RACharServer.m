//
//  RACharServer.m
//  rAthenaChar
//
//  Created by Leon Li on 2021/5/19.
//

#import "RACharServer.h"
#import "RACharConsole.h"
#include "showmsg.hpp"

extern int main (int argc, char **argv);

int console_write(void *cookie, const char *buf, int n) {
    RACharConsole *console = (__bridge RACharConsole *)(cookie);
    NSData *data = [NSData dataWithBytes:buf length:n];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [console write:string];
    return 0;
}

@implementation RACharServer

- (instancetype)init {
    self = [super init];
    if (self) {
        _console = [[RACharConsole alloc] init];
    }
    return self;
}

- (void)main {
    FILE *f = fwopen((__bridge const void *)(self.console), console_write);
    STDOUT = f;
    STDERR = f;

    char *arg0 = "Char-Server";
    char *args[1] = {arg0};
    main(1, args);

    fclose(f);
}

@end
