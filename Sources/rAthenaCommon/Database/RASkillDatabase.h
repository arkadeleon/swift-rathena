//
//  RASkillDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/3/6.
//

#import <Foundation/Foundation.h>
#import "RADatabaseMode.h"
#import "RASkillTree.h"

NS_ASSUME_NONNULL_BEGIN

@interface RASkillDatabase : NSObject

- (void)fetchSkillTreesInMode:(RADatabaseMode)mode completionHandler:(void (^)(NSArray<RASkillTree *> *skillTrees))completionHandler NS_SWIFT_ASYNC(2);

@end

NS_ASSUME_NONNULL_END
