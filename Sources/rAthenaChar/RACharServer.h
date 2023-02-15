//
//  RACharServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

@import rAthenaCommon;

@interface RACharServer : RAServer

@property (nonatomic, class, readonly, strong) RACharServer *sharedServer;

@end
