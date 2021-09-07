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

int write_function(void *cookie, const char *buf, int n) {
    LoginServerOutputHandler handler = LoginServerHandlers.sharedHandlers.outputHandler;
    if (handler) {
        NSData *data = [NSData dataWithBytes:buf length:n];
        handler(data);
    }
    return 0;
}

void do_recv(int fd) {
    LoginServerDataReceiveHandler handler = LoginServerHandlers.sharedHandlers.dataReceiveHandler;
    if (handler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        handler(data);
    }
}

void do_send(int fd) {
    LoginServerDataSendHandler handler = LoginServerHandlers.sharedHandlers.dataSendHandler;
    if (handler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        handler(data);
    }
}

NSString *LoginServerGetName() {
    return @"Login Server";
}

void LoginServerSetOutputHandler(LoginServerOutputHandler handler) {
    LoginServerHandlers.sharedHandlers.outputHandler = handler;

    static FILE *output = nil;
    if (output == nil) {
        output = fwopen(0, write_function);
        STDOUT = output;
        STDERR = output;
    }
}

void LoginServerSetDataReceiveHandler(LoginServerDataReceiveHandler handler) {
    LoginServerHandlers.sharedHandlers.dataReceiveHandler = handler;
    recv_callback = do_recv;
}

void LoginServerSetDataSendHandler(LoginServerDataSendHandler handler) {
    LoginServerHandlers.sharedHandlers.dataSendHandler = handler;
    send_callback = do_send;
}

void LoginServerMain() {
    char arg0[] = "Login-Server";
    char *args[1] = {arg0};
    main(1, args);
}
