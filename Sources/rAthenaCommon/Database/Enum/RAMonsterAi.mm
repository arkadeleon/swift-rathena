//
//  RAMonsterAi.m
//  rAthena
//
//  Created by Leon Li on 2023/3/16.
//

#import "RAMonsterAi.h"
#include "map/mob.hpp"

@implementation RAMonsterAi

+ (RAMonsterAi *)ai01 {
    static RAMonsterAi *ai01 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai01 = [[RAMonsterAi alloc] init];
        ai01.value = MONSTER_TYPE_01;
        ai01.name = @"01";
        ai01.englishName = @"01";
    });
    return ai01;
}

+ (RAMonsterAi *)ai02 {
    static RAMonsterAi *ai02 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai02 = [[RAMonsterAi alloc] init];
        ai02.value = MONSTER_TYPE_02;
        ai02.name = @"02";
        ai02.englishName = @"02";
    });
    return ai02;
}

+ (RAMonsterAi *)ai03 {
    static RAMonsterAi *ai03 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai03 = [[RAMonsterAi alloc] init];
        ai03.value = MONSTER_TYPE_03;
        ai03.name = @"03";
        ai03.englishName = @"03";
    });
    return ai03;
}

+ (RAMonsterAi *)ai04 {
    static RAMonsterAi *ai04 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai04 = [[RAMonsterAi alloc] init];
        ai04.value = MONSTER_TYPE_04;
        ai04.name = @"04";
        ai04.englishName = @"04";
    });
    return ai04;
}

+ (RAMonsterAi *)ai05 {
    static RAMonsterAi *ai05 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai05 = [[RAMonsterAi alloc] init];
        ai05.value = MONSTER_TYPE_05;
        ai05.name = @"05";
        ai05.englishName = @"05";
    });
    return ai05;
}

+ (RAMonsterAi *)ai06 {
    static RAMonsterAi *ai06 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai06 = [[RAMonsterAi alloc] init];
        ai06.value = MONSTER_TYPE_06;
        ai06.name = @"06";
        ai06.englishName = @"06";
    });
    return ai06;
}

+ (RAMonsterAi *)ai07 {
    static RAMonsterAi *ai07 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai07 = [[RAMonsterAi alloc] init];
        ai07.value = MONSTER_TYPE_07;
        ai07.name = @"07";
        ai07.englishName = @"07";
    });
    return ai07;
}

+ (RAMonsterAi *)ai08 {
    static RAMonsterAi *ai08 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai08 = [[RAMonsterAi alloc] init];
        ai08.value = MONSTER_TYPE_08;
        ai08.name = @"08";
        ai08.englishName = @"08";
    });
    return ai08;
}

+ (RAMonsterAi *)ai09 {
    static RAMonsterAi *ai09 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai09 = [[RAMonsterAi alloc] init];
        ai09.value = MONSTER_TYPE_09;
        ai09.name = @"09";
        ai09.englishName = @"09";
    });
    return ai09;
}

+ (RAMonsterAi *)ai10 {
    static RAMonsterAi *ai10 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai10 = [[RAMonsterAi alloc] init];
        ai10.value = MONSTER_TYPE_10;
        ai10.name = @"10";
        ai10.englishName = @"10";
    });
    return ai10;
}

+ (RAMonsterAi *)ai11 {
    static RAMonsterAi *ai11 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai11 = [[RAMonsterAi alloc] init];
        ai11.value = MONSTER_TYPE_11;
        ai11.name = @"11";
        ai11.englishName = @"11";
    });
    return ai11;
}

+ (RAMonsterAi *)ai12 {
    static RAMonsterAi *ai12 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai12 = [[RAMonsterAi alloc] init];
        ai12.value = MONSTER_TYPE_12;
        ai12.name = @"12";
        ai12.englishName = @"12";
    });
    return ai12;
}

+ (RAMonsterAi *)ai13 {
    static RAMonsterAi *ai13 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai13 = [[RAMonsterAi alloc] init];
        ai13.value = MONSTER_TYPE_13;
        ai13.name = @"13";
        ai13.englishName = @"13";
    });
    return ai13;
}

+ (RAMonsterAi *)ai17 {
    static RAMonsterAi *ai17 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai17 = [[RAMonsterAi alloc] init];
        ai17.value = MONSTER_TYPE_17;
        ai17.name = @"17";
        ai17.englishName = @"17";
    });
    return ai17;
}

+ (RAMonsterAi *)ai19 {
    static RAMonsterAi *ai19 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai19 = [[RAMonsterAi alloc] init];
        ai19.value = MONSTER_TYPE_19;
        ai19.name = @"19";
        ai19.englishName = @"19";
    });
    return ai19;
}

+ (RAMonsterAi *)ai20 {
    static RAMonsterAi *ai20 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai20 = [[RAMonsterAi alloc] init];
        ai20.value = MONSTER_TYPE_20;
        ai20.name = @"20";
        ai20.englishName = @"20";
    });
    return ai20;
}

+ (RAMonsterAi *)ai21 {
    static RAMonsterAi *ai21 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai21 = [[RAMonsterAi alloc] init];
        ai21.value = MONSTER_TYPE_21;
        ai21.name = @"21";
        ai21.englishName = @"21";
    });
    return ai21;
}

+ (RAMonsterAi *)ai24 {
    static RAMonsterAi *ai24 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai24 = [[RAMonsterAi alloc] init];
        ai24.value = MONSTER_TYPE_24;
        ai24.name = @"24";
        ai24.englishName = @"24";
    });
    return ai24;
}

+ (RAMonsterAi *)ai25 {
    static RAMonsterAi *ai25 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai25 = [[RAMonsterAi alloc] init];
        ai25.value = MONSTER_TYPE_25;
        ai25.name = @"25";
        ai25.englishName = @"25";
    });
    return ai25;
}

+ (RAMonsterAi *)ai26 {
    static RAMonsterAi *ai26 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai26 = [[RAMonsterAi alloc] init];
        ai26.value = MONSTER_TYPE_26;
        ai26.name = @"26";
        ai26.englishName = @"26";
    });
    return ai26;
}

+ (RAMonsterAi *)ai27 {
    static RAMonsterAi *ai27 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ai27 = [[RAMonsterAi alloc] init];
        ai27.value = MONSTER_TYPE_27;
        ai27.name = @"27";
        ai27.englishName = @"27";
    });
    return ai27;
}

+ (NSArray<RAMonsterAi *> *)allCases {
    static NSArray<RAMonsterAi *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RAMonsterAi.ai01,
            RAMonsterAi.ai02,
            RAMonsterAi.ai03,
            RAMonsterAi.ai04,
            RAMonsterAi.ai05,
            RAMonsterAi.ai06,
            RAMonsterAi.ai07,
            RAMonsterAi.ai08,
            RAMonsterAi.ai09,
            RAMonsterAi.ai10,
            RAMonsterAi.ai11,
            RAMonsterAi.ai12,
            RAMonsterAi.ai13,
            RAMonsterAi.ai17,
            RAMonsterAi.ai19,
            RAMonsterAi.ai20,
            RAMonsterAi.ai21,
            RAMonsterAi.ai24,
            RAMonsterAi.ai25,
            RAMonsterAi.ai26,
            RAMonsterAi.ai27,
        ];
    });
    return allCases;
}

@end
