//
//  NSString+RAConstants.h
//  rAthena
//
//  Created by Leon Li on 2023/7/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#ifdef __cplusplus
extern "C" {
#endif

extern NSString *NSStringFromRAArmorType(NSInteger armorType);
extern NSString *NSStringFromRACardType(NSInteger cardType);
extern NSString *NSStringFromRAItemType(NSInteger itemType);
extern NSString *NSStringFromRAWeaponType(NSInteger weaponType);

#ifdef __cplusplus
}
#endif

NS_ASSUME_NONNULL_END
