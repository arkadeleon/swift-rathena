//
//  RADatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/6/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RADatabase<RecordType> : NSObject

@property (nonatomic, readonly, copy) NSString *name;

- (void)recoverCache:(NSMutableDictionary<NSNumber *, RecordType> *)cache;

- (NSArray<RecordType> *)allRecords;
- (RecordType _Nullable)recordWithID:(NSInteger)recordID;

@end

NS_ASSUME_NONNULL_END
