//
//  RAMapServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

@import rAthenaCommon;

@interface RAMapServer : RAServer

@property (nonatomic, class, readonly, strong) RAMapServer *sharedServer;

@end
