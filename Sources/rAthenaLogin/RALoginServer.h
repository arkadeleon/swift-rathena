//
//  RALoginServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

@import rAthenaCommon;

@interface RALoginServer : RAServer

@property (nonatomic, class, readonly, strong) RALoginServer *sharedServer;

@end
