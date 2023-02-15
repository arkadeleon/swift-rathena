//
//  RAWebServer.m
//  rAthena
//
//  Created by Leon Li on 2022/11/1.
//

#import "RAWebServer.h"
#include "common/core.hpp"
#include "common/showmsg.hpp"
#include "common/socket.hpp"

extern int main (int argc, char **argv);

extern void *tfl_root;

int write_function(void *cookie, const char *buf, int n) {
    RAWebServer *webServer = RAWebServer.sharedServer;

    if (webServer.outputHandler) {
        NSData *data = [NSData dataWithBytes:buf length:n];
        webServer.outputHandler(data);
    }

    return 0;
}

void do_recv(int fd) {
    RAWebServer *webServer = RAWebServer.sharedServer;

    if (webServer.dataReceiveHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        webServer.dataReceiveHandler(data);
    }
}

void do_send(int fd) {
    RAWebServer *webServer = RAWebServer.sharedServer;

    if (webServer.dataSendHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        webServer.dataSendHandler(data);
    }
}

@interface RAWebServer ()

@property (nonatomic, strong) NSThread *thread;

@end

@implementation RAWebServer

+ (RAWebServer *)sharedServer {
    static RAWebServer *sharedServer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedServer = [[RAWebServer alloc] init];
    });
    return sharedServer;
}

- (NSString *)name {
    return @"Web Server";
}

- (void)start {
    if (self.thread == nil) {
        self.thread = [[NSThread alloc] initWithBlock:^{
            FILE *output = fwopen(0, write_function);
            STDOUT = output;
            STDERR = output;

            recv_callback = do_recv;
            send_callback = do_send;

            char arg0[] = "web-server";
            char *args[1] = {arg0};
            main(1, args);
        }];
    }

    if (self.thread.isExecuting) {
        return;
    }

    [self.thread start];
}

- (void)stop {
    if (self.thread == nil) {
        return;
    }

    if (!self.thread.isExecuting) {
        return;
    }

    global_core->signal_shutdown();

    tfl_root = NULL;

    self.thread = nil;
}

@end
