//
//  RAItemDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/6/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RAItem2;

@interface RAItemDatabase : NSObject

- (void)fetchItemsWithCompletionHandler:(void (^)(NSArray<RAItem2 *> *items))completionHandler NS_SWIFT_ASYNC(1);

@end

NS_ASSUME_NONNULL_END
