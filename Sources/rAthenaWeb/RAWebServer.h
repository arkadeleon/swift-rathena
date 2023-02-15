//
//  RAWebServer.h
//  rAthena
//
//  Created by Leon Li on 2022/11/1.
//

#import <Foundation/Foundation.h>

@import rAthenaCommon;

@interface RAWebServer : RAServer

@property (nonatomic, class, readonly, strong) RAWebServer *sharedServer;

@end
