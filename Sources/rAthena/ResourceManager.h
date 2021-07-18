//
//  ResourceManager.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResourceManager : NSObject

@property (class, nonatomic, readonly) ResourceManager *sharedManager;

- (void)copyBundleResourcesAndChangeDirectory;

@end

NS_ASSUME_NONNULL_END
