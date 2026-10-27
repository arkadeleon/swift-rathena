//
//  WebServerPre.h
//  rAthena
//
//  Created by Leon Li on 2026/10/27.
//

#import <Foundation/Foundation.h>
#import <rAthenaCommon.h>

NS_ASSUME_NONNULL_BEGIN

__attribute__((visibility("default")))
@interface WebServerPre : Server

@property (nonatomic, class, readonly) WebServerPre *sharedServer NS_SWIFT_NAME(shared);

@end

NS_ASSUME_NONNULL_END
