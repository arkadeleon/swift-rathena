//
//  RAEnum.h
//  rAthena
//
//  Created by Leon Li on 2023/3/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAEnum : NSObject

@property (nonatomic, class, readonly) NSArray<RAEnum *> *allCases;

@property (nonatomic) NSInteger value;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *englishName;

+ (nullable instancetype)valueOfName:(NSString *)name;
+ (NSSet *)valuesOfNames:(NSDictionary<NSString *, NSNumber *> *)names;

@end

NS_ASSUME_NONNULL_END
