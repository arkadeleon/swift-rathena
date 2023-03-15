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
        normal.englishName = @"";
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

+ (instancetype)caseOfName:(NSString *)name {
    static NSArray<RACardType *> *allCardTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCardTypes = @[
            RACardType.enchant,
        ];
    });

    for (RACardType *cardType in allCardTypes) {
        if ([cardType.name caseInsensitiveCompare:name] == NSOrderedSame) {
            return cardType;
        }
    }
    return nil;
}

@end
