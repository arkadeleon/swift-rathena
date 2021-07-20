//
//  LoginServer.m
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import "LoginServer.h"
#include "showmsg.hpp"
#include "socket.hpp"

extern int main (int argc, char **argv);

LoginServerDataReceiveHandler loginServerDataReceiveHandler = nil;
LoginServerDataSendHandler loginServerDataSendHandler = nil;

void do_recv(int fd) {
    if (loginServerDataReceiveHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        loginServerDataReceiveHandler(data);
    }
}

void do_send(int fd) {
    if (loginServerDataSendHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        loginServerDataSendHandler(data);
    }
}

NSString *LoginServerGetName() {
    return @"Login Server";
}

void LoginServerSetOutput(FILE *output) {
    STDOUT = output;
    STDERR = output;
}

void LoginServerSetDataReceiveHandler(LoginServerDataReceiveHandler handler) {
    loginServerDataReceiveHandler = handler;
    recv_callback = do_recv;
}

void LoginServerSetDataSendHandler(LoginServerDataSendHandler handler) {
    loginServerDataSendHandler = handler;
    send_callback = do_send;
}

void LoginServerMain() {
    char arg0[] = "Login-Server";
    char *args[1] = {arg0};
    main(1, args);
}
