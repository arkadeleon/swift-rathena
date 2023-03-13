//
//  RAItemDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/2/22.
//

#import <Foundation/Foundation.h>
#import "RADatabaseMode.h"
#import "RAItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface RAItemDatabase : NSObject

- (void)fetchItemsInMode:(RADatabaseMode)mode completionHandler:(void (^)(NSArray<RAItem *> *items))completionHandler NS_SWIFT_ASYNC(2);

@end

NS_ASSUME_NONNULL_END
