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

+ (nullable instancetype)caseOfName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
