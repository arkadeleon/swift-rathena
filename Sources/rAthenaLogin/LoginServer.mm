//
//  LoginServer.m
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import "LoginServer.h"
#import "../rAthenaCommon/ServerPrivate.h"
#include "common/core.hpp"
#include "common/showmsg.hpp"

extern int main (int argc, char **argv);

extern void *tfl_root;

int write_function(void *cookie, const char *buf, int n) {
    NSDictionary *userInfo = @{
        ServerOutputDataKey: [NSData dataWithBytes:buf length:n]
    };
    [[NSNotificationCenter defaultCenter] postNotificationName:ServerDidOutputDataNotification object:LoginServer.sharedServer userInfo:userInfo];

    return n;
}

@interface LoginServer ()

@property (nonatomic) NSThread *thread;

@end

@implementation LoginServer

+ (LoginServer *)sharedServer {
    static LoginServer *sharedServer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedServer = [[LoginServer alloc] init];
    });
    return sharedServer;
}

- (NSString *)name {
    return @"Login Server";
}

- (void)start {
    self.thread = [[NSThread alloc] initWithBlock:^{
        FILE *output = fwopen(0, write_function);
        STDOUT = output;
        STDERR = output;

        char arg0[] = "login-server";
        char *args[1] = {arg0};
        main(1, args);
    }];
    [self.thread start];

    // Wait until global_core is not null.
    while (global_core == NULL) {
        usleep(1000);
    }

    // Wait until global_core status is running.
    while (global_core->get_status() != rathena::server_core::e_core_status::RUNNING) {
        usleep(1000);
    }
}

- (void)stop {
    global_core->signal_shutdown();

    tfl_root = NULL;

    // Wait until global_core status is stopped.
    while (global_core->get_status() == rathena::server_core::e_core_status::STOPPED) {
        usleep(1000);
    }

    global_core = NULL;

    self.thread = nil;
}

@end
