//
//  RAResourceManager.h
//  rAthena
//
//  Created by Leon Li on 2023/2/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAResourceManager : NSObject

@property (nonatomic, class, readonly) RAResourceManager *sharedManager;

- (NSString *)pathForResource:(NSString *)name;
- (NSData *)dataForResource:(NSString *)name;

- (void)copyResourcesToLibraryDirectory;

@end

NS_ASSUME_NONNULL_END
