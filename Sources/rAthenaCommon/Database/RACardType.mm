//
//  RACardType.m
//  rAthena
//
//  Created by Leon Li on 2023/3/14.
//

#import "RACardType.h"

#include "../../../src/map/pc.hpp"

@implementation RACardType

+ (RACardType *)normal {
    static RACardType *normal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        normal = [[RACardType alloc] init];
        normal.typeID = CARD_NORMAL;
        normal.aegisName = @"";
        normal.name = @"";
    });
    return normal;
}

+ (RACardType *)enchant {
    static RACardType *enchant = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        enchant = [[RACardType alloc] init];
        enchant.typeID = CARD_ENCHANT;
        enchant.aegisName = @"Enchant";
        enchant.name = @"Enchant";
    });
    return enchant;
}

+ (instancetype)cardTypeWithAegisName:(NSString *)aegisName {
    static NSArray<RACardType *> *allCardTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCardTypes = @[
            RACardType.enchant,
        ];
    });

    for (RACardType *cardType in allCardTypes) {
        if ([cardType.aegisName caseInsensitiveCompare:aegisName] == NSOrderedSame) {
            return cardType;
        }
    }
    return nil;
}

@end
