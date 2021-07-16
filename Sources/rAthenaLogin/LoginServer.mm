//
//  LoginServer.m
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import "LoginServer.h"
#include "showmsg.hpp"

extern int main (int argc, char **argv);

NSString *LoginServerGetName() {
    return @"Login Server";
}

void LoginServerSetOutput(FILE *output) {
    STDOUT = output;
    STDERR = output;
}

void LoginServerMain() {
    char arg0[] = "Login-Server";
    char *args[1] = {arg0};
    main(1, args);
}
