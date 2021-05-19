//
//  RALoginServer.m
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import "RALoginServer.h"

extern int main (int argc, char **argv);

@implementation RALoginServer

- (void)main {
    char *arg0 = "Login-Server";
    char *args[1] = {arg0};
    main(1, args);
}

@end
