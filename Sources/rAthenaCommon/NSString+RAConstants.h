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

extern NSString *NSStringFromRAAmmoType(NSInteger ammoType);
extern NSString *NSStringFromRACardType(NSInteger cardType);
extern NSString *NSStringFromRAElement(NSInteger element);
extern NSString *NSStringFromRAItemType(NSInteger itemType);
extern NSString *NSStringFromRAMode(NSInteger mode);
extern NSString *NSStringFromRAMonsterClass(NSInteger monsterClass);
extern NSString *NSStringFromRAParameter(NSInteger parameter);
extern NSString *NSStringFromRARace(NSInteger race);
extern NSString *NSStringFromRASex(NSInteger sex);
extern NSString *NSStringFromRASize(NSInteger size);
extern NSString *NSStringFromRAWeaponType(NSInteger weaponType);

#ifdef __cplusplus
}
#endif

NS_ASSUME_NONNULL_END
