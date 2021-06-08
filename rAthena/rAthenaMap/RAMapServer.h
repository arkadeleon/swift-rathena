//
//  RAMapServer.h
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RAMapConsole;

@interface RAMapServer : NSThread

@property (nonatomic, readonly, strong) RAMapConsole *console;

@end

NS_ASSUME_NONNULL_END
