//
//  WebServer.m
//  rAthena
//
//  Created by Leon Li on 2022/11/1.
//

#import "WebServer.h"
#include "common/core.hpp"
#include "common/showmsg.hpp"
#include "common/socket.hpp"

extern int runflag;
extern int main (int argc, char **argv);

extern void *tfl_root;

int write_function(void *cookie, const char *buf, int n) {
    WebServer *webServer = (WebServer *)[NSThread currentThread];
    NSCAssert([webServer isKindOfClass:[WebServer class]], @"Current thread is not web server.");

    if (webServer.outputHandler) {
        NSData *data = [NSData dataWithBytes:buf length:n];
        webServer.outputHandler(data);
    }

    return 0;
}

void do_recv(int fd) {
    WebServer *webServer = (WebServer *)[NSThread currentThread];
    NSCAssert([webServer isKindOfClass:[WebServer class]], @"Current thread is not web server.");

    if (webServer.dataReceiveHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        webServer.dataReceiveHandler(data);
    }
}

void do_send(int fd) {
    WebServer *webServer = (WebServer *)[NSThread currentThread];
    NSCAssert([webServer isKindOfClass:[WebServer class]], @"Current thread is not web server.");

    if (webServer.dataSendHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        webServer.dataSendHandler(data);
    }
}

@implementation WebServer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"Web Server";
    }
    return self;
}

- (void)main {
    FILE *output = fwopen(0, write_function);
    STDOUT = output;
    STDERR = output;

    recv_callback = do_recv;
    send_callback = do_send;

    char arg0[] = "web-server";
    char *args[1] = {arg0};
    main(1, args);
}

- (void)cancel {
    [super cancel];

    runflag = CORE_ST_STOP;
    tfl_root = NULL;
}

@end
