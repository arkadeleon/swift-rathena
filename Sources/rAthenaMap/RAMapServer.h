//
//  RAMapServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import <RAServer.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAMapServer : RAServer

@property (nonatomic, class, readonly) RAMapServer *sharedServer;

@end

NS_ASSUME_NONNULL_END
