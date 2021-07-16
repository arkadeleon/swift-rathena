//
//  CharServer.m
//  rAthenaChar
//
//  Created by Leon Li on 2021/5/19.
//

#import "CharServer.h"
#include "showmsg.hpp"

extern int main (int argc, char **argv);

NSString *CharServerGetName() {
    return @"Char Server";
}

void CharServerSetOutput(FILE *output) {
    STDOUT = output;
    STDERR = output;
}

void CharServerMain() {
    char arg0[] = "Char-Server";
    char *args[1] = {arg0};
    main(1, args);
}
