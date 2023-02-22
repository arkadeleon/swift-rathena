//
//  RAItemDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/2/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAItem : NSObject

@property (nonatomic, readonly, assign) NSUInteger itemID;
@property (nonatomic, readonly, copy) NSString *aegisName;
@property (nonatomic, readonly, copy) NSString *name;

@end

@interface RAItemDatabase : NSObject

- (void)fetchAllItemsWithCompletionHandler:(void (^)(NSArray<RAItem *> *items))completionHandler NS_SWIFT_ASYNC(1);

@end

NS_ASSUME_NONNULL_END
