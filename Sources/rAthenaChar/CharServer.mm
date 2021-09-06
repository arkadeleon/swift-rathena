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

int write_function(void *cookie, const char *buf, int n) {
    CharServerOutputHandler handler = CharServerHandlers.sharedHandlers.outputHandler;
    if (handler) {
        NSString *message = [[NSString alloc] initWithBytes:buf length:n encoding:NSUTF8StringEncoding];
        handler(message);
    }
    return 0;
}

void do_recv(int fd) {
    CharServerDataReceiveHandler handler = CharServerHandlers.sharedHandlers.dataReceiveHandler;
    if (handler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        handler(data);
    }
}

void do_send(int fd) {
    CharServerDataSendHandler handler = CharServerHandlers.sharedHandlers.dataSendHandler;
    if (handler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        handler(data);
    }
}

NSString *CharServerGetName() {
    return @"Char Server";
}

void CharServerSetOutputHandler(CharServerOutputHandler handler) {
    CharServerHandlers.sharedHandlers.outputHandler = handler;

    static FILE *output = nil;
    if (output == nil) {
        output = fwopen(0, write_function);
        STDOUT = output;
        STDERR = output;
    }
}

void CharServerSetDataReceiveHandler(CharServerDataReceiveHandler handler) {
    CharServerHandlers.sharedHandlers.dataReceiveHandler = handler;
    recv_callback = do_recv;
}

void CharServerSetDataSendHandler(CharServerDataSendHandler handler) {
    CharServerHandlers.sharedHandlers.dataSendHandler = handler;
    send_callback = do_send;
}

void CharServerMain() {
    char arg0[] = "Char-Server";
    char *args[1] = {arg0};
    main(1, args);
}
