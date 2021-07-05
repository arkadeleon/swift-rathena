//
//  MapServer.m
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import "MapServer.h"
#include "core.hpp"
#include "showmsg.hpp"

extern int main (int argc, char **argv);

@implementation MapServer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"Map Server";
    }
    return self;
}

- (void)main {
    STDOUT = self.output;
    STDERR = self.output;

    char arg0[] = "Map-Server";
    char *args[1] = {arg0};
    main(1, args);
}

- (void)send:(NSString *)input {
    parse_console(input.UTF8String);
}

@end
