//
//  RAWeaponType.h
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAWeaponType : NSObject

@property (nonatomic, class, readonly) RAWeaponType *fist;
@property (nonatomic, class, readonly) RAWeaponType *dagger;
@property (nonatomic, class, readonly) RAWeaponType *oneHandedSword;
@property (nonatomic, class, readonly) RAWeaponType *twoHandedSword;
@property (nonatomic, class, readonly) RAWeaponType *oneHandedSpear;
@property (nonatomic, class, readonly) RAWeaponType *twoHandedSpear;
@property (nonatomic, class, readonly) RAWeaponType *oneHandedAxe;
@property (nonatomic, class, readonly) RAWeaponType *twoHandedAxe;
@property (nonatomic, class, readonly) RAWeaponType *mace;
@property (nonatomic, class, readonly) RAWeaponType *twoHandedMace;
@property (nonatomic, class, readonly) RAWeaponType *staff;
@property (nonatomic, class, readonly) RAWeaponType *bow;
@property (nonatomic, class, readonly) RAWeaponType *knuckle;
@property (nonatomic, class, readonly) RAWeaponType *musical;
@property (nonatomic, class, readonly) RAWeaponType *whip;
@property (nonatomic, class, readonly) RAWeaponType *book;
@property (nonatomic, class, readonly) RAWeaponType *katar;
@property (nonatomic, class, readonly) RAWeaponType *revolver;
@property (nonatomic, class, readonly) RAWeaponType *rifle;
@property (nonatomic, class, readonly) RAWeaponType *gatling;
@property (nonatomic, class, readonly) RAWeaponType *shotgun;
@property (nonatomic, class, readonly) RAWeaponType *grenade;
@property (nonatomic, class, readonly) RAWeaponType *huuma;
@property (nonatomic, class, readonly) RAWeaponType *twoHandedStaff;

@property (nonatomic) NSInteger typeID;
@property (nonatomic, copy) NSString *aegisName;
@property (nonatomic, copy) NSString *name;

+ (nullable instancetype)weaponTypeWithAegisName:(NSString *)aegisName;

@end

NS_ASSUME_NONNULL_END
