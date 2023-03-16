//
//  RAAmmoType.m
//  rAthena
//
//  Created by Leon Li on 2023/3/14.
//

#import "RAAmmoType.h"
#include "map/pc.hpp"

@implementation RAAmmoType

+ (RAAmmoType *)arrow {
    static RAAmmoType *arrow = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        arrow = [[RAAmmoType alloc] init];
        arrow.value = AMMO_ARROW;
        arrow.name = @"Arrow";
        arrow.englishName = @"Arrow";
    });
    return arrow;
}

+ (RAAmmoType *)dagger {
    static RAAmmoType *dagger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dagger = [[RAAmmoType alloc] init];
        dagger.value = AMMO_DAGGER;
        dagger.name = @"Dagger";
        dagger.englishName = @"Dagger";
    });
    return dagger;
}

+ (RAAmmoType *)bullet {
    static RAAmmoType *bullet = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bullet = [[RAAmmoType alloc] init];
        bullet.value = AMMO_BULLET;
        bullet.name = @"Bullet";
        bullet.englishName = @"Bullet";
    });
    return bullet;
}

+ (RAAmmoType *)shell {
    static RAAmmoType *shell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shell = [[RAAmmoType alloc] init];
        shell.value = AMMO_SHELL;
        shell.name = @"Shell";
        shell.englishName = @"Shell";
    });
    return shell;
}

+ (RAAmmoType *)grenade {
    static RAAmmoType *grenade = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        grenade = [[RAAmmoType alloc] init];
        grenade.value = AMMO_GRENADE;
        grenade.name = @"Grenade";
        grenade.englishName = @"Grenade";
    });
    return grenade;
}

+ (RAAmmoType *)shuriken {
    static RAAmmoType *shuriken = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shuriken = [[RAAmmoType alloc] init];
        shuriken.value = AMMO_SHURIKEN;
        shuriken.name = @"Shuriken";
        shuriken.englishName = @"Shuriken";
    });
    return shuriken;
}

+ (RAAmmoType *)kunai {
    static RAAmmoType *kunai = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kunai = [[RAAmmoType alloc] init];
        kunai.value = AMMO_KUNAI;
        kunai.name = @"Kunai";
        kunai.englishName = @"Kunai";
    });
    return kunai;
}

+ (RAAmmoType *)cannonBall {
    static RAAmmoType *cannonBall = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cannonBall = [[RAAmmoType alloc] init];
        cannonBall.value = AMMO_CANNONBALL;
        cannonBall.name = @"Cannonball";
        cannonBall.englishName = @"Cannon Ball";
    });
    return cannonBall;
}

+ (RAAmmoType *)throwWeapon {
    static RAAmmoType *throwWeapon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        throwWeapon = [[RAAmmoType alloc] init];
        throwWeapon.value = AMMO_THROWWEAPON;
        throwWeapon.name = @"Throwweapon";
        throwWeapon.englishName = @"Throw Weapon";
    });
    return throwWeapon;
}

+ (NSArray<RAAmmoType *> *)allCases {
    static NSArray<RAAmmoType *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
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
    return allCases;
}

@end
