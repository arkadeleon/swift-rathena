//
//  RACardType.h
//  rAthena
//
//  Created by Leon Li on 2023/3/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RACardType : NSObject

@property (nonatomic, class, readonly) RACardType *normal;
@property (nonatomic, class, readonly) RACardType *enchant;

@property (nonatomic) NSInteger typeID;
@property (nonatomic, copy) NSString *aegisName;
@property (nonatomic, copy) NSString *name;

+ (nullable instancetype)cardTypeWithAegisName:(NSString *)aegisName;

@end

NS_ASSUME_NONNULL_END
