//
//  RACharServer.h
//  rAthenaChar
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RACharConsole;

@interface RACharServer : NSThread

@property (nonatomic, readonly, strong) RACharConsole *console;

@end

NS_ASSUME_NONNULL_END
