//
//  RAAmmoType.m
//  rAthena
//
//  Created by Leon Li on 2023/3/14.
//

#import "RAAmmoType.h"

#include "map/pc.hpp"

@implementation RAAmmoType

+ (RAAmmoType *)none {
    static RAAmmoType *none = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        none = [[RAAmmoType alloc] init];
        none.typeID = AMMO_NONE;
        none.aegisName = @"";
        none.name = @"";
    });
    return none;
}

+ (RAAmmoType *)arrow {
    static RAAmmoType *arrow = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        arrow = [[RAAmmoType alloc] init];
        arrow.typeID = AMMO_ARROW;
        arrow.aegisName = @"Arrow";
        arrow.name = @"Arrow";
    });
    return arrow;
}

+ (RAAmmoType *)dagger {
    static RAAmmoType *dagger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dagger = [[RAAmmoType alloc] init];
        dagger.typeID = AMMO_DAGGER;
        dagger.aegisName = @"Dagger";
        dagger.name = @"Dagger";
    });
    return dagger;
}

+ (RAAmmoType *)bullet {
    static RAAmmoType *bullet = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bullet = [[RAAmmoType alloc] init];
        bullet.typeID = AMMO_BULLET;
        bullet.aegisName = @"Bullet";
        bullet.name = @"Bullet";
    });
    return bullet;
}

+ (RAAmmoType *)shell {
    static RAAmmoType *shell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shell = [[RAAmmoType alloc] init];
        shell.typeID = AMMO_SHELL;
        shell.aegisName = @"Shell";
        shell.name = @"Shell";
    });
    return shell;
}

+ (RAAmmoType *)grenade {
    static RAAmmoType *grenade = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        grenade = [[RAAmmoType alloc] init];
        grenade.typeID = AMMO_GRENADE;
        grenade.aegisName = @"Grenade";
        grenade.name = @"Grenade";
    });
    return grenade;
}

+ (RAAmmoType *)shuriken {
    static RAAmmoType *shuriken = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shuriken = [[RAAmmoType alloc] init];
        shuriken.typeID = AMMO_SHURIKEN;
        shuriken.aegisName = @"Shuriken";
        shuriken.name = @"Shuriken";
    });
    return shuriken;
}

+ (RAAmmoType *)kunai {
    static RAAmmoType *kunai = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kunai = [[RAAmmoType alloc] init];
        kunai.typeID = AMMO_KUNAI;
        kunai.aegisName = @"Kunai";
        kunai.name = @"Kunai";
    });
    return kunai;
}

+ (RAAmmoType *)cannonBall {
    static RAAmmoType *cannonBall = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cannonBall = [[RAAmmoType alloc] init];
        cannonBall.typeID = AMMO_CANNONBALL;
        cannonBall.aegisName = @"Cannonball";
        cannonBall.name = @"Cannon Ball";
    });
    return cannonBall;
}

+ (RAAmmoType *)throwWeapon {
    static RAAmmoType *throwWeapon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        throwWeapon = [[RAAmmoType alloc] init];
        throwWeapon.typeID = AMMO_THROWWEAPON;
        throwWeapon.aegisName = @"Throwweapon";
        throwWeapon.name = @"Throw Weapon";
    });
    return throwWeapon;
}

+ (instancetype)ammoTypeWithAegisName:(NSString *)aegisName {
    static NSArray<RAAmmoType *> *allAmmoTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allAmmoTypes = @[
            RAAmmoType.arrow,
            RAAmmoType.dagger,
            RAAmmoType.bullet,
            RAAmmoType.shell,
            RAAmmoType.grenade,
            RAAmmoType.shuriken,
            RAAmmoType.kunai,
            RAAmmoType.cannonBall,
            RAAmmoType.throwWeapon,
        ];
    });

    for (RAAmmoType *ammoType in allAmmoTypes) {
        if ([ammoType.aegisName caseInsensitiveCompare:aegisName] == NSOrderedSame) {
            return ammoType;
        }
    }
    return nil;
}

@end
