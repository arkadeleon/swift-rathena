//
//  RADatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/2/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RADatabaseMode) {
    RADatabaseModePrerenewal,
    RADatabaseModeRenewal,
};

@class RAItem;
@class RAMonster;
@class RASkillTree;
@class RASkill;

@interface RADatabase : NSObject

@property (nonatomic, class, readonly) RADatabase *prerenewal;
@property (nonatomic, class, readonly) RADatabase *renewal;

@property (nonatomic, readonly) RADatabaseMode mode;

- (instancetype)init NS_UNAVAILABLE;

- (void)fetchItemsWithCompletionHandler:(void (^)(NSArray<RAItem *> *items))completionHandler NS_SWIFT_ASYNC(1);

- (void)fetchMonstersWithCompletionHandler:(void (^)(NSArray<RAMonster *> *monsters))completionHandler NS_SWIFT_ASYNC(1);

- (void)fetchSkillTreesWithCompletionHandler:(void (^)(NSArray<RASkillTree *> *skillTrees))completionHandler NS_SWIFT_ASYNC(1);

- (void)fetchSkillsWithCompletionHandler:(void (^)(NSArray<RASkill *> *skills))completionHandler NS_SWIFT_ASYNC(1);

@end

NS_ASSUME_NONNULL_END
