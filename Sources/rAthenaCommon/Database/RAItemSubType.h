//
//  RAItemSubType.h
//  rAthena
//
//  Created by Leon Li on 2023/3/14.
//

#import <Foundation/Foundation.h>

@class RAItemType;
@class RAWeaponType;
@class RAAmmoType;
@class RACardType;

NS_ASSUME_NONNULL_BEGIN

@interface RAItemSubType : NSObject

+ (nullable instancetype)itemSubTypeOfType:(RAItemType *)type name:(nullable NSString *)name;

- (nullable RAWeaponType *)asWeaponType;
- (nullable RAAmmoType *)asAmmoType;
- (nullable RACardType *)asCardType;

@end

NS_ASSUME_NONNULL_END
