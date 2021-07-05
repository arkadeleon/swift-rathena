//
//  CharServer.m
//  rAthenaChar
//
//  Created by Leon Li on 2021/5/19.
//

#import "CharServer.h"
#include "core.hpp"
#include "showmsg.hpp"

extern int main (int argc, char **argv);

@implementation CharServer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"Char Server";
    }
    return self;
}

- (void)main {
    STDOUT = self.output;
    STDERR = self.output;

    char arg0[] = "Char-Server";
    char *args[1] = {arg0};
    main(1, args);
}

- (void)send:(NSString *)input {
    parse_console(input.UTF8String);
}

@end
