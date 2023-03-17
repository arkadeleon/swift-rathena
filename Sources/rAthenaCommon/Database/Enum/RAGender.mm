//
//  RAGender.m
//  rAthena
//
//  Created by Leon Li on 2023/3/17.
//

#import "RAGender.h"
#include "common/mmo.hpp"

@implementation RAGender

+ (RAGender *)female {
    static RAGender *female = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        female = [[RAGender alloc] init];
        female.value = SEX_FEMALE;
        female.name = @"Female";
        female.englishName = @"Female";
    });
    return female;
}

+ (RAGender *)male {
    static RAGender *male = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        male = [[RAGender alloc] init];
        male.value = SEX_MALE;
        male.name = @"Male";
        male.englishName = @"Male";
    });
    return male;
}

+ (RAGender *)both {
    static RAGender *both = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        both = [[RAGender alloc] init];
        both.value = SEX_BOTH;
        both.name = @"Both";
        both.englishName = @"Both";
    });
    return both;
}

+ (NSArray<RAGender *> *)allCases {
    static NSArray<RAGender *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RAGender.female,
            RAGender.male,
            RAGender.both,
        ];
    });
    return allCases;
}

@end
