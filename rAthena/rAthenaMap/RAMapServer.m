//
//  RAMapServer.m
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import "RAMapServer.h"
#include "showmsg.hpp"

extern int main (int argc, char **argv);

@implementation RAMapServer

- (void)main {
    STDOUT = self.output;
    STDERR = self.output;

    char *arg0 = "Map-Server";
    char *args[1] = {arg0};
    main(1, args);
}

@end
