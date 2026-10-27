//
//  MapServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import <rAthenaCommon.h>

NS_ASSUME_NONNULL_BEGIN

__attribute__((visibility("default")))
@interface MapServer : Server

@property (nonatomic, class, readonly) MapServer *sharedServer NS_SWIFT_NAME(shared);

@end

NS_ASSUME_NONNULL_END
