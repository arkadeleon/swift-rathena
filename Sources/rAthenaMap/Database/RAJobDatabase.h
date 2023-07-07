//
//  RAJobDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/7/7.
//

#import <Foundation/Foundation.h>

@import rAthenaCommon;

NS_ASSUME_NONNULL_BEGIN

@interface RAJobDatabase : RADatabase

@property (nonatomic, class, readonly) RAJobDatabase *sharedDatabase;

@end

@interface RAJob : RADatabaseRecord

/// Job ID.
@property (nonatomic) NSInteger jobID;

/// Base maximum weight.
@property (nonatomic) NSInteger maxWeight;

/// Exponential HP increase.
/// Per base level: [HpFactor * BaseLv / 100].
/// Used when macro @c HP_SP_TABLES is disabled.
@property (nonatomic) NSInteger hpFactor;

/// Linear HP increase.
/// Per base level: [HpIncrease / 100].
/// Used when macro @c HP_SP_TABLES is disabled.
@property (nonatomic) NSInteger hpIncrease;

/// Linear SP increase.
/// Per base level: [SpIncrease / 100].
/// Used when macro @c HP_SP_TABLES is disabled.
@property (nonatomic) NSInteger spIncrease;

/// Base ASPD for each weapon type.
///
/// @discussion See enum @c weapon_type in pc.hpp
@property (nonatomic, copy) NSArray<NSNumber *> *baseASPD;

/// Job level bonus stats/traits.
///
/// @discussion See enum @c e_params in pc.hpp
@property (nonatomic, copy) NSArray<NSArray<NSNumber *> *> *bonusStats;

/// Maximum stats/traits applicable.
///
/// @discussion See enum @c e_params in pc.hpp
@property (nonatomic) NSArray<NSNumber *> *maxStats;

/// Maximum base level.
@property (nonatomic) NSInteger maxBaseLevel;

/// Base experience per level.
@property (nonatomic, copy) NSArray<NSNumber *> *baseExp;

/// Maximum job level.
@property (nonatomic) NSInteger maxJobLevel;

/// Job experience per level.
@property (nonatomic, copy) NSArray<NSNumber *> *jobExp;

/// Base HP per base level.
@property (nonatomic, copy) NSArray<NSNumber *> *baseHp;

/// Base SP per base level.
@property (nonatomic, copy) NSArray<NSNumber *> *baseSp;

/// Base AP per base level.
@property (nonatomic, copy) NSArray<NSNumber *> *baseAp;

@end

NS_ASSUME_NONNULL_END
