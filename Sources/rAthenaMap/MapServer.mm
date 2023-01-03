//
//  MapServer.m
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import "MapServer.h"
#include "common/core.hpp"
#include "common/showmsg.hpp"
#include "common/socket.hpp"

extern int main (int argc, char **argv);

extern void *tfl_root;

int write_function(void *cookie, const char *buf, int n) {
    MapServer *mapServer = (MapServer *)[NSThread currentThread];
    NSCAssert([mapServer isKindOfClass:[MapServer class]], @"Current thread is not map server.");

    if (mapServer.outputHandler) {
        NSData *data = [NSData dataWithBytes:buf length:n];
        mapServer.outputHandler(data);
    }

    return 0;
}

void do_recv(int fd) {
    MapServer *mapServer = (MapServer *)[NSThread currentThread];
    NSCAssert([mapServer isKindOfClass:[MapServer class]], @"Current thread is not map server.");

    if (mapServer.dataReceiveHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        mapServer.dataReceiveHandler(data);
    }
}

void do_send(int fd) {
    MapServer *mapServer = (MapServer *)[NSThread currentThread];
    NSCAssert([mapServer isKindOfClass:[MapServer class]], @"Current thread is not map server.");

    if (mapServer.dataSendHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        mapServer.dataSendHandler(data);
    }
}

@implementation MapServer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"Map Server";
    }
    return self;
}

- (void)main {
    FILE *output = fwopen(0, write_function);
    STDOUT = output;
    STDERR = output;

    recv_callback = do_recv;
    send_callback = do_send;

    char arg0[] = "map-server";
    char *args[1] = {arg0};
    main(1, args);
}

- (void)cancel {
    [super cancel];

    global_core->signal_shutdown();

    tfl_root = NULL;
}

@end
