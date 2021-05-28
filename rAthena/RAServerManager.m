//
//  RAServerManager.m
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import "RAServerManager.h"

@implementation RAServerManager

+ (RAServerManager *)sharedManager {
    static RAServerManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[RAServerManager alloc] init];
    });
    return sharedManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _charServer = [[RACharServer alloc] init];
        _loginServer = [[RALoginServer alloc] init];
        _mapServer = [[RAMapServer alloc] init];
    }
    return self;
}

- (void)copyBundleResourcesAndChangeDirectory {
    NSURL *src = [[NSBundle bundleForClass:[RAServerManager class]] bundleURL];
    NSURL *dst = [[NSFileManager defaultManager] URLForDirectory:NSLibraryDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSArray<NSString *> *items = @[@"ragnarok.sqlite3", @"conf", @"db", @"npc"];
    for (NSString *item in items) {
        [[NSFileManager defaultManager] copyItemAtURL:[src URLByAppendingPathComponent:item] toURL:[dst URLByAppendingPathComponent:item] error:nil];
    }

    chdir(dst.path.UTF8String);
}

@end
