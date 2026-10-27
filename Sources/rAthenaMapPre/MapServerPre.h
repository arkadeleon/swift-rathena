//
//  MapServerPre.h
//  rAthena
//
//  Created by Leon Li on 2026/10/27.
//

#import <Foundation/Foundation.h>
#import <rAthenaCommon.h>

NS_ASSUME_NONNULL_BEGIN

__attribute__((visibility("default")))
@interface MapServerPre : Server

@property (nonatomic, class, readonly) MapServerPre *sharedServer;

@end

NS_ASSUME_NONNULL_END
