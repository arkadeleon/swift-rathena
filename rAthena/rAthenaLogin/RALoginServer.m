//
//  RALoginServer.m
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import "RALoginServer.h"
#include "showmsg.hpp"

extern int main (int argc, char **argv);

@implementation RALoginServer

- (void)main {
    STDOUT = self.output;
    STDERR = self.output;

    char *arg0 = "Login-Server";
    char *args[1] = {arg0};
    main(1, args);
}

@end
