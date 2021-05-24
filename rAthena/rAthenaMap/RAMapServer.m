//
//  RAMapServer.m
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import "RAMapServer.h"

extern int main (int argc, char **argv);

@implementation RAMapServer

- (void)main {
    char *arg0 = "Map-Server";
    char *args[1] = {arg0};
    main(1, args);
}

@end
