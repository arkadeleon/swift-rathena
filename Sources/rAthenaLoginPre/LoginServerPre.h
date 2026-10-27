//
//  LoginServerPre.h
//  rAthena
//
//  Created by Leon Li on 2026/10/27.
//

#import <Foundation/Foundation.h>
#import <rAthenaCommon.h>

NS_ASSUME_NONNULL_BEGIN

__attribute__((visibility("default")))
@interface LoginServerPre : Server

@property (nonatomic, class, readonly) LoginServerPre *sharedServer NS_SWIFT_NAME(shared);

@end

NS_ASSUME_NONNULL_END
