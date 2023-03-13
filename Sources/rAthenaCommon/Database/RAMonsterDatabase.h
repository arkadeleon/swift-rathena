//
//  RAMonsterDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/2/26.
//

#import <Foundation/Foundation.h>
#import "RADatabaseMode.h"
#import "RAMonster.h"

NS_ASSUME_NONNULL_BEGIN

@interface RAMonsterDatabase : NSObject

- (void)fetchMonstersInMode:(RADatabaseMode)mode completionHandler:(void (^)(NSArray<RAMonster *> *monsters))completionHandler NS_SWIFT_ASYNC(2);

@end

NS_ASSUME_NONNULL_END
