//
//  RAAmmoType.h
//  rAthena
//
//  Created by Leon Li on 2023/3/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAAmmoType : NSObject

@property (nonatomic, class, readonly) RAAmmoType *none;
@property (nonatomic, class, readonly) RAAmmoType *arrow;
@property (nonatomic, class, readonly) RAAmmoType *dagger;
@property (nonatomic, class, readonly) RAAmmoType *bullet;
@property (nonatomic, class, readonly) RAAmmoType *shell;
@property (nonatomic, class, readonly) RAAmmoType *grenade;
@property (nonatomic, class, readonly) RAAmmoType *shuriken;
@property (nonatomic, class, readonly) RAAmmoType *kunai;
@property (nonatomic, class, readonly) RAAmmoType *cannonBall;
@property (nonatomic, class, readonly) RAAmmoType *throwWeapon;

@property (nonatomic) NSInteger typeID;
@property (nonatomic, copy) NSString *aegisName;
@property (nonatomic, copy) NSString *name;

+ (nullable instancetype)ammoTypeWithAegisName:(NSString *)aegisName;

@end

NS_ASSUME_NONNULL_END
