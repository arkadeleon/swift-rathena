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

- (void)recoverCache:(NSMutableDictionary<NSNumber *, RAJob *> *)cache {
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

@end
