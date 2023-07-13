//
//  RAJobDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/7/7.
//

#import "RAJobDatabase.h"
#import "RASkillTreeDatabase.h"
#include "map/pc.hpp"

@interface RAJob ()

- (instancetype)initWithEntry:(std::unordered_map<unsigned short, std::shared_ptr<s_job_info>>::iterator)entry;

@end

@implementation RAJobDatabase

+ (RAJobDatabase *)sharedDatabase {
    static RAJobDatabase *sharedDatabase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDatabase = [[RAJobDatabase alloc] init];
    });
    return sharedDatabase;
}

- (NSString *)name {
    return @"Job Database";
}

- (void)recoverCache:(NSMutableDictionary<NSNumber *, RADatabaseRecord *> *)cache {
    for (auto entry = job_db.begin(); entry != job_db.end(); ++entry) {
        RAJob *job = [[RAJob alloc] initWithEntry:entry];
        cache[@(job.jobID)] = job;
    }
}

@end

@implementation RAJob

- (instancetype)initWithEntry:(std::unordered_map<unsigned short, std::shared_ptr<s_job_info>>::iterator)entry {
    self = [super init];
    if (self) {
        _jobID = entry->first;
        _jobName = [NSString stringWithUTF8String:job_name(entry->first)];
        _maxWeight = entry->second->max_weight_base;
        _hpFactor = entry->second->hp_factor;
        _hpIncrease = entry->second->hp_increase;
        _spIncrease = entry->second->sp_increase;
        _baseASPD = NSArrayFromInt16Array(entry->second->aspd_base.data(), entry->second->aspd_base.size());

        NSMutableArray<NSArray<NSNumber *> *> *bonusStats = [NSMutableArray arrayWithCapacity:entry->second->job_bonus.size()];
        for (auto bonus : entry->second->job_bonus) {
            [bonusStats addObject:NSArrayFromUInt16Array(bonus.data(), bonus.size())];
        }
        _bonusStats = [bonusStats copy];

        _maxStats = NSArrayFromUInt16Array(entry->second->max_param, PARAM_MAX);

        _maxBaseLevel = entry->second->max_base_level;
        _baseExp = NSArrayFromUInt64Array(entry->second->base_exp, MAX_LEVEL);

        _maxJobLevel = entry->second->max_job_level;
        _jobExp = NSArrayFromUInt64Array(entry->second->job_exp, MAX_LEVEL);

        _baseHp = NSArrayFromUInt32Array(entry->second->base_hp.data(), entry->second->base_hp.size());
        _baseSp = NSArrayFromUInt32Array(entry->second->base_sp.data(), entry->second->base_sp.size());
        _baseAp = NSArrayFromUInt32Array(entry->second->base_ap.data(), entry->second->base_ap.size());
    }
    return self;
}

- (NSInteger)recordID {
    return self.jobID;
}

- (NSString *)recordTitle {
    return self.jobName;
}

- (NSArray<RADatabaseRecordField *> *)recordFields {
    NSMutableArray<RADatabaseRecordField *> *fields = [NSMutableArray array];

    [fields ra_addFieldWithName:@"Max Weight" numberValue:@(self.maxWeight)];
    [fields ra_addFieldWithName:@"HP Factor" numberValue:@(self.hpFactor)];
    [fields ra_addFieldWithName:@"HP Increase" numberValue:@(self.hpIncrease)];
    [fields ra_addFieldWithName:@"SP Increase" numberValue:@(self.spIncrease)];

    NSMutableArray<RADatabaseRecordField *> *baseASPDFields = [NSMutableArray arrayWithCapacity:self.baseASPD.count];
    for (NSInteger weaponType = 0; weaponType < self.baseASPD.count; weaponType++) {
        [baseASPDFields ra_addFieldWithName:NSStringFromRAWeaponType(weaponType) numberValue:self.baseASPD[weaponType]];
    }
    [fields ra_addFieldWithName:@"Base ASPD" arrayValue:baseASPDFields];

    NSMutableArray<RADatabaseRecordField *> *bonusStatsFields = [NSMutableArray arrayWithCapacity:self.bonusStats.count];
    for (NSInteger level = 0; level < self.bonusStats.count; level++) {
        NSMutableArray<RADatabaseRecordField *> *levelBonusStatsFields = [NSMutableArray arrayWithCapacity:self.bonusStats[level].count];
        for (NSInteger parameter = 0; parameter < self.bonusStats[level].count; parameter++) {
            [levelBonusStatsFields ra_addFieldWithName:NSStringFromRAParameter(parameter) numberValue:self.bonusStats[level][parameter]];
        }
        [bonusStatsFields ra_addFieldWithName:[NSString stringWithFormat:@"Level %ld", level + 1] arrayValue:levelBonusStatsFields];
    }
    [fields ra_addFieldWithName:@"Bonus Stats" arrayValue:bonusStatsFields];

    NSMutableArray<RADatabaseRecordField *> *maxStatsFields = [NSMutableArray arrayWithCapacity:self.maxStats.count];
    for (NSInteger parameter = 0; parameter < self.maxStats.count; parameter++) {
        [maxStatsFields ra_addFieldWithName:NSStringFromRAParameter(parameter) numberValue:self.maxStats[parameter]];
    }
    [fields ra_addFieldWithName:@"Max Stats" arrayValue:maxStatsFields];

    [fields ra_addFieldWithName:@"Max Base Level" numberValue:@(self.maxBaseLevel)];

    NSMutableArray<RADatabaseRecordField *> *baseExpFields = [NSMutableArray arrayWithCapacity:self.baseExp.count];
    for (NSInteger level = 0; level < self.maxBaseLevel - 1; level++) {
        [baseExpFields ra_addFieldWithName:[NSString stringWithFormat:@"Level %ld", level + 1] numberValue:self.baseExp[level]];
    }
    [fields ra_addFieldWithName:@"Base Exp" arrayValue:baseExpFields];

    [fields ra_addFieldWithName:@"Max Job Level" numberValue:@(self.maxJobLevel)];

    NSMutableArray<RADatabaseRecordField *> *jobExpFields = [NSMutableArray arrayWithCapacity:self.jobExp.count];
    for (NSInteger level = 0; level < self.maxJobLevel - 1; level++) {
        [jobExpFields ra_addFieldWithName:[NSString stringWithFormat:@"Level %ld", level + 1] numberValue:self.jobExp[level]];
    }
    [fields ra_addFieldWithName:@"Job Exp" arrayValue:jobExpFields];

    NSMutableArray<RADatabaseRecordField *> *baseHpFields = [NSMutableArray arrayWithCapacity:self.baseHp.count];
    for (NSInteger level = 0; level < self.baseHp.count; level++) {
        [baseHpFields ra_addFieldWithName:[NSString stringWithFormat:@"Level %ld", level + 1] numberValue:self.baseHp[level]];
    }
    [fields ra_addFieldWithName:@"Base HP" arrayValue:baseHpFields];

    NSMutableArray<RADatabaseRecordField *> *baseSpFields = [NSMutableArray arrayWithCapacity:self.baseSp.count];
    for (NSInteger level = 0; level < self.baseSp.count; level++) {
        [baseSpFields ra_addFieldWithName:[NSString stringWithFormat:@"Level %ld", level + 1] numberValue:self.baseSp[level]];
    }
    [fields ra_addFieldWithName:@"Base SP" arrayValue:baseSpFields];

    NSMutableArray<RADatabaseRecordField *> *baseApFields = [NSMutableArray arrayWithCapacity:self.baseAp.count];
    for (NSInteger level = 0; level < self.baseAp.count; level++) {
        [baseApFields ra_addFieldWithName:[NSString stringWithFormat:@"Level %ld", level + 1] numberValue:self.baseAp[level]];
    }
    [fields ra_addFieldWithName:@"Base AP" arrayValue:baseApFields];

    RASkillTree *skillTree = [[RASkillTreeDatabase sharedDatabase] recordWithID:self.jobID];
    if (skillTree) {
        [fields ra_addFieldWithName:@"Skill Tree" referenceValue:skillTree];
    }

    return [fields copy];
}

@end
