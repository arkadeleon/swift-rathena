//
//  RACharServer.m
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import "RACharServer.h"

extern int main (int argc, char **argv);

@implementation RACharServer

- (void)main {
    char *arg0 = "Char-Server";
    char *args[1] = {arg0};
    main(1, args);
}

@end
