//
//  MapServer.m
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import "MapServer.h"
#include "showmsg.hpp"

extern int main (int argc, char **argv);

NSString *MapServerGetName() {
    return @"Map Server";
}

void MapServerSetOutput(FILE *output) {
    STDOUT = output;
    STDERR = output;
}

void MapServerMain() {
    char arg0[] = "Map-Server";
    char *args[1] = {arg0};
    main(1, args);
}
