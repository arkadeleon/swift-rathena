//
//  RACharServer.m
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import "RACharServer.h"
#include "common/core.hpp"
#include "common/showmsg.hpp"
#include "common/socket.hpp"

extern int main (int argc, char **argv);

extern void *tfl_root;

int write_function(void *cookie, const char *buf, int n) {
    RACharServer *charServer = (RACharServer *)[NSThread currentThread];
    NSCAssert([charServer isKindOfClass:[RACharServer class]], @"Current thread is not char server.");

    if (charServer.outputHandler) {
        NSData *data = [NSData dataWithBytes:buf length:n];
        charServer.outputHandler(data);
    }

    return 0;
}

void do_recv(int fd) {
    RACharServer *charServer = (RACharServer *)[NSThread currentThread];
    NSCAssert([charServer isKindOfClass:[RACharServer class]], @"Current thread is not char server.");

    if (charServer.dataReceiveHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        charServer.dataReceiveHandler(data);
    }
}

void do_send(int fd) {
    RACharServer *charServer = (RACharServer *)[NSThread currentThread];
    NSCAssert([charServer isKindOfClass:[RACharServer class]], @"Current thread is not char server.");

    if (charServer.dataSendHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        charServer.dataSendHandler(data);
    }
}

@implementation RACharServer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"Char Server";
    }
    return self;
}

- (void)main {
    FILE *output = fwopen(0, write_function);
    STDOUT = output;
    STDERR = output;

    recv_callback = do_recv;
    send_callback = do_send;

    char arg0[] = "char-server";
    char *args[1] = {arg0};
    main(1, args);
}

- (void)cancel {
    [super cancel];

    global_core->signal_shutdown();

    tfl_root = NULL;
}

@end
