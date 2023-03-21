//
//  RASkillTree.m
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import "RASkillTree.h"
#import "Enum/RAJob.h"

@implementation RASkillTree

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"job"      : @"Job",
        @"inherit"  : @"Inherit",
        @"tree"     : @"Tree",
    };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"tree"     : [RASkillTreeSkill class],
    };
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSDictionary<NSString *, NSNumber *> *inheritNames = dic[@"Inherit"];
    if (inheritNames) {
        _inherit = [RAJob valuesOfNames:inheritNames];
    }

    return YES;
}

@end

@implementation RASkillTreeSkill

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"name"     : @"Name",
        @"maxLevel" : @"MaxLevel",
        @"exclude"  : @"Exclude",
        @"baseLevel": @"BaseLevel",
        @"jobLevel" : @"JobLevel",
        @"requires" : @"Requires",
    };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"requires" : [RASkillTreeRequiredSkill class],
    };
}

@end

@implementation RASkillTreeRequiredSkill

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"name" : @"Name",
        @"level": @"Level",
    };
}

@end
