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

@end
