//
//  RAMapServer.m
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import "RAMapServer.h"
#import "../rAthenaCommon/RAServerPrivate.h"
#include "common/core.hpp"
#include "common/showmsg.hpp"
#include "common/socket.hpp"

extern int main (int argc, char **argv);

extern void *tfl_root;

int write_function(void *cookie, const char *buf, int n) {
    RAMapServer *server = RAMapServer.sharedServer;

    if (server.outputHandler == nil) {
        return 0;
    }

    NSData *data = [NSData dataWithBytes:buf length:n];
    server.outputHandler(data);
    return n;
}

void do_recv(int fd) {
    RAMapServer *mapServer = RAMapServer.sharedServer;

    if (mapServer.dataReceiveHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        mapServer.dataReceiveHandler(data);
    }
}

void do_send(int fd) {
    RAMapServer *mapServer = RAMapServer.sharedServer;

    if (mapServer.dataSendHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        mapServer.dataSendHandler(data);
    }
}

@interface RAMapServer ()

@property (nonatomic) NSThread *thread;

@end

@implementation RAMapServer

+ (RAMapServer *)sharedServer {
    static RAMapServer *sharedServer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedServer = [[RAMapServer alloc] init];
    });
    return sharedServer;
}

- (NSString *)name {
    return @"Map Server";
}

- (void)startWithCompletionHandler:(void (^)(BOOL))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.thread == nil) {
            self.thread = [[NSThread alloc] initWithBlock:^{
                FILE *output = fwopen(0, write_function);
                STDOUT = output;
                STDERR = output;

                recv_callback = do_recv;
                send_callback = do_send;

                char arg0[] = "map-server";
                char *args[1] = {arg0};
                main(1, args);
            }];
        }

        if (self.thread.isExecuting) {
            completionHandler(NO);
            return;
        }

        [self.thread start];

        while (global_core == NULL) {
        }

        global_core->set_status_changed([&self](rathena::server_core::e_core_status status) {
            switch (status) {
                case rathena::server_core::e_core_status::NOT_STARTED:
                    self.status = RAServerStatusNotStarted;
                    break;
                case rathena::server_core::e_core_status::CORE_INITIALIZING:
                case rathena::server_core::e_core_status::CORE_INITIALIZED:
                case rathena::server_core::e_core_status::SERVER_INITIALIZING:
                case rathena::server_core::e_core_status::SERVER_INITIALIZED:
                    self.status = RAServerStatusStarting;
                    break;
                case rathena::server_core::e_core_status::RUNNING:
                    self.status = RAServerStatusRunning;
                    break;
                case rathena::server_core::e_core_status::STOPPING:
                case rathena::server_core::e_core_status::SERVER_FINALIZING:
                case rathena::server_core::e_core_status::SERVER_FINALIZED:
                case rathena::server_core::e_core_status::CORE_FINALIZING:
                case rathena::server_core::e_core_status::CORE_FINALIZED:
                    self.status = RAServerStatusStopping;
                    break;
                case rathena::server_core::e_core_status::STOPPED:
                    self.status = RAServerStatusStopped;
                    break;
            }
        });

        while (self.status != RAServerStatusRunning) {
        }

        completionHandler(YES);
    });
}

- (void)stopWithCompletionHandler:(void (^)(BOOL))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.thread == nil) {
            completionHandler(NO);
            return;
        }

        if (!self.thread.isExecuting) {
            completionHandler(NO);
            return;
        }

        global_core->signal_shutdown();

        tfl_root = NULL;

        self.thread = nil;

        while (self.status != RAServerStatusStopped) {
        }

        completionHandler(YES);
    });
}

@end
