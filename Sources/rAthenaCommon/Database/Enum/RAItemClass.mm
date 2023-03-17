//
//  RAItemClass.m
//  rAthena
//
//  Created by Leon Li on 2023/3/17.
//

#import "RAItemClass.h"
#include "map/itemdb.hpp"

@implementation RAItemClass

+ (RAItemClass *)normal {
    static RAItemClass *normal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        normal = [[RAItemClass alloc] init];
        normal.value = ITEMJ_NORMAL;
        normal.name = @"Normal";
        normal.englishName = @"Normal";
    });
    return normal;
}

+ (RAItemClass *)upper {
    static RAItemClass *upper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        upper = [[RAItemClass alloc] init];
        upper.value = ITEMJ_UPPER;
        upper.name = @"Upper";
        upper.englishName = @"Upper";
    });
    return upper;
}

+ (RAItemClass *)baby {
    static RAItemClass *baby = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baby = [[RAItemClass alloc] init];
        baby.value = ITEMJ_BABY;
        baby.name = @"Baby";
        baby.englishName = @"Baby";
    });
    return baby;
}

+ (RAItemClass *)third {
    static RAItemClass *third = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        third = [[RAItemClass alloc] init];
        third.value = ITEMJ_THIRD;
        third.name = @"Third";
        third.englishName = @"Third";
    });
    return third;
}

+ (RAItemClass *)thirdUpper {
    static RAItemClass *thirdUpper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thirdUpper = [[RAItemClass alloc] init];
        thirdUpper.value = ITEMJ_THIRD_UPPER;
        thirdUpper.name = @"Third_Upper";
        thirdUpper.englishName = @"Third Upper";
    });
    return thirdUpper;
}

+ (RAItemClass *)thirdBaby {
    static RAItemClass *thirdBaby = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thirdBaby = [[RAItemClass alloc] init];
        thirdBaby.value = ITEMJ_THIRD_BABY;
        thirdBaby.name = @"Third_Baby";
        thirdBaby.englishName = @"Third Baby";
    });
    return thirdBaby;
}

+ (RAItemClass *)fourth {
    static RAItemClass *fourth = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fourth = [[RAItemClass alloc] init];
        fourth.value = ITEMJ_FOURTH;
        fourth.name = @"Fourth";
        fourth.englishName = @"Fourth";
    });
    return fourth;
}

+ (NSArray<RAItemClass *> *)allUpper {
    static NSArray<RAItemClass *> *allUpper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allUpper = @[
            RAItemClass.upper,
            RAItemClass.thirdUpper,
            RAItemClass.fourth,
        ];
    });
    return allUpper;
}

+ (NSArray<RAItemClass *> *)allBaby {
    static NSArray<RAItemClass *> *allBaby = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allBaby = @[
            RAItemClass.baby,
            RAItemClass.thirdBaby,
        ];
    });
    return allBaby;
}

+ (NSArray<RAItemClass *> *)allThird {
    static NSArray<RAItemClass *> *allThird = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allThird = @[
            RAItemClass.third,
            RAItemClass.thirdUpper,
            RAItemClass.thirdBaby,
        ];
    });
    return allThird;
}

+ (NSArray<RAItemClass *> *)allCases {
    static NSArray<RAItemClass *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RAItemClass.normal,
            RAItemClass.upper,
            RAItemClass.baby,
            RAItemClass.third,
            RAItemClass.thirdUpper,
            RAItemClass.thirdBaby,
            RAItemClass.fourth,
        ];
    });
    return allCases;
}

@end
