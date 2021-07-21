//
//  CharServer.m
//  rAthenaChar
//
//  Created by Leon Li on 2021/5/19.
//

#import "CharServer.h"
#include "showmsg.hpp"
#include "socket.hpp"

extern int main (int argc, char **argv);

CharServerDataReceiveHandler charServerDataReceiveHandler = nil;
CharServerDataSendHandler charServerDataSendHandler = nil;

void do_recv(int fd) {
    if (charServerDataReceiveHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        charServerDataReceiveHandler(data);
    }
}

void do_send(int fd) {
    if (charServerDataSendHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        charServerDataSendHandler(data);
    }
}

NSString *CharServerGetName() {
    return @"Char Server";
}

void CharServerSetOutput(FILE *output) {
    STDOUT = output;
    STDERR = output;
}

void CharServerSetDataReceiveHandler(CharServerDataReceiveHandler handler) {
    charServerDataReceiveHandler = handler;
    recv_callback = do_recv;
}

void CharServerSetDataSendHandler(CharServerDataSendHandler handler) {
    charServerDataSendHandler = handler;
    send_callback = do_send;
}

void CharServerMain() {
    char arg0[] = "Char-Server";
    char *args[1] = {arg0};
    main(1, args);
}
