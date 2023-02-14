//
//  RALoginServer.m
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import "RALoginServer.h"
#include "common/core.hpp"
#include "common/showmsg.hpp"
#include "common/socket.hpp"

extern int main (int argc, char **argv);

extern void *tfl_root;

int write_function(void *cookie, const char *buf, int n) {
    RALoginServer *loginServer = (RALoginServer *)[NSThread currentThread];
    NSCAssert([loginServer isKindOfClass:[RALoginServer class]], @"Current thread is not login server.");

    if (loginServer.outputHandler) {
        NSData *data = [NSData dataWithBytes:buf length:n];
        loginServer.outputHandler(data);
    }

    return 0;
}

void do_recv(int fd) {
    RALoginServer *loginServer = (RALoginServer *)[NSThread currentThread];
    NSCAssert([loginServer isKindOfClass:[RALoginServer class]], @"Current thread is not login server.");

    if (loginServer.dataReceiveHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        loginServer.dataReceiveHandler(data);
    }
}

void do_send(int fd) {
    RALoginServer *loginServer = (RALoginServer *)[NSThread currentThread];
    NSCAssert([loginServer isKindOfClass:[RALoginServer class]], @"Current thread is not login server.");

    if (loginServer.dataSendHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        loginServer.dataSendHandler(data);
    }
}

@implementation RALoginServer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"Login Server";
    }
    return self;
}

- (void)main {
    FILE *output = fwopen(0, write_function);
    STDOUT = output;
    STDERR = output;

    recv_callback = do_recv;
    send_callback = do_send;

    char arg0[] = "login-server";
    char *args[1] = {arg0};
    main(1, args);
}

- (void)cancel {
    [super cancel];

    global_core->signal_shutdown();

    tfl_root = NULL;
}

@end
