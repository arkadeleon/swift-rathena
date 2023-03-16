//
//  RACardType.m
//  rAthena
//
//  Created by Leon Li on 2023/3/14.
//

#import "RACardType.h"
#include "map/pc.hpp"

@implementation RACardType

+ (RACardType *)normal {
    static RACardType *normal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        normal = [[RACardType alloc] init];
        normal.value = CARD_NORMAL;
        normal.name = @"";
        normal.englishName = @"Normal";
    });
    return normal;
}

+ (RACardType *)enchant {
    static RACardType *enchant = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        enchant = [[RACardType alloc] init];
        enchant.value = CARD_ENCHANT;
        enchant.name = @"Enchant";
        enchant.englishName = @"Enchant";
    });
    return enchant;
}

+ (NSArray<RACardType *> *)allCases {
    static NSArray<RACardType *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RACardType.normal,
            RACardType.enchant,
        ];
    });
    return allCases;
}

@end
