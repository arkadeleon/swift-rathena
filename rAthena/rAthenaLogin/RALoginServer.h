//
//  RALoginServer.h
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RALoginConsole;

@interface RALoginServer : NSThread

@property (nonatomic, readonly, strong) RALoginConsole *console;

@end

NS_ASSUME_NONNULL_END
