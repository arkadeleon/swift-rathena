//
//  LoginServer.m
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import "LoginServer.h"
#include "core.hpp"
#include "showmsg.hpp"

extern int main (int argc, char **argv);

@interface LoginServer ()

@property (nonatomic, strong) NSThread *server;

@end

@implementation LoginServer

@synthesize output = _output;

- (instancetype)init {
    self = [super init];
    if (self) {
        _name = @"Login Server";
    }
    return self;
}

- (void)dealloc {
    [_server cancel];
}

- (FILE *)output {
    return _output;
}

- (void)setOutput:(FILE *)output {
    _output = output;

    STDOUT = output;
    STDERR = output;
}

- (BOOL)start {
    if (self.server.isCancelled || self.server.isFinished) {
        self.server = nil;
    }

    if (self.server == nil) {
        self.server = [[NSThread alloc] initWithBlock:^{
            char arg0[] = "Login-Server";
            char *args[1] = {arg0};
            main(1, args);
        }];
    }

    if (self.server.isExecuting) {
        return NO;
    }

    [self.server start];

    return YES;
}

- (BOOL)stop {
    if (self.server == nil) {
        return NO;
    }

    if (self.server.isCancelled || self.server.isFinished) {
        self.server = nil;
        return NO;
    }

    if (self.server.isExecuting) {
        runflag = CORE_ST_STOP;
        return YES;
    }

    return NO;
}

- (void)send:(NSString *)input {
    parse_console(input.UTF8String);
}

@end
