//
//  CharServer.m
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import "CharServer.h"
#import "../rAthenaCommon/ServerPrivate.h"
#include "common/core.hpp"
#include "common/showmsg.hpp"

extern int main (int argc, char **argv);

int write_function(void *cookie, const char *buf, int n) {
    CharServer *server = CharServer.sharedServer;
    NSDictionary *userInfo = @{
        ServerOutputDataKey: [NSData dataWithBytes:buf length:n]
    };

    dispatch_async(server.outputQueue, ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:ServerDidOutputDataNotification object:server userInfo:userInfo];
    });

    return n;
}

TIMER_FUNC(shutdown_timer) {
    global_core->signal_shutdown();
    return 0;
}

@interface CharServer ()

@property (nonatomic) NSThread *thread;

@end

@implementation CharServer

+ (CharServer *)sharedServer {
    static CharServer *sharedServer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedServer = [[CharServer alloc] init];
    });
    return sharedServer;
}

- (NSString *)name {
    return @"Char Server";
}

- (void)start {
    self.thread = [[NSThread alloc] initWithBlock:^{
        FILE *output = fwopen(0, write_function);
        STDOUT = output;
        STDERR = output;

        char arg0[] = "char-server";
        char *args[1] = {arg0};
        main(1, args);
    }];
    [self.thread start];

    // Wait until global_core is not null.
    while (global_core == nullptr) {
        usleep(1000);
    }

    // Wait until global_core status is running.
    while (global_core->get_status() != rathena::server_core::e_core_status::RUNNING) {
        usleep(1000);
    }
}

- (void)stop {
    add_timer(gettick(), shutdown_timer, 0, 0);

    // Wait until global_core is null.
    while (global_core != nullptr) {
        usleep(1000);
    }

    self.thread = nil;
}

@end
