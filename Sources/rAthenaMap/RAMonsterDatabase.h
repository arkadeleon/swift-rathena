//
//  RAMonsterDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RAMonster2;

@interface RAMonsterDatabase : NSObject

- (void)fetchMonstersWithCompletionHandler:(void (^)(NSArray<RAMonster2 *> *monsters))completionHandler NS_SWIFT_ASYNC(1);

@end

NS_ASSUME_NONNULL_END
