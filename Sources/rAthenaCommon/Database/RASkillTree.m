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
        @"tree"     : @"Tree",
    };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"tree"     : [RASkillTreeSkill class],
    };
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    // Inherit
    NSDictionary<NSString *, NSNumber *> *inherit = dic[@"Inherit"];
    self.inherit = [RAJob valuesOfNames:inherit];

    return YES;
}

@end

@implementation RASkillTreeSkill

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"name"         : @"Name",
        @"maxLevel"     : @"MaxLevel",
        @"exclude"      : @"Exclude",
        @"baseLevel"    : @"BaseLevel",
        @"jobLevel"     : @"JobLevel",
        @"requires"     : @"Requires",
    };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"requires" : [RASkillTreeRequiredSkill class],
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _exclude = NO;
        _baseLevel = 0;
        _jobLevel = 0;
    }
}

@end

@implementation RASkillTreeRequiredSkill

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"name"     : @"Name",
        @"level"    : @"Level",
    };
}

@end
