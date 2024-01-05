//
//  RAItemDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/6/25.
//

#import <Foundation/Foundation.h>

@import rAthenaCommon;

NS_ASSUME_NONNULL_BEGIN

@class RAItem;
@class RAItemFlags;
@class RAItemDelay;
@class RAItemStack;
@class RAItemNoUse;
@class RAItemTrade;

@interface RAItemDatabase : RADatabase<RAItem *>

@property (nonatomic, class, readonly) RAItemDatabase *sharedDatabase;

@end

@interface RAItem : NSObject

/// Item ID.
@property (nonatomic) NSInteger itemID;

/// Server name to reference the item in scripts and lookups, should use no spaces.
@property (nonatomic, copy) NSString *aegisName;

/// Name in English for displaying as output.
@property (nonatomic, copy) NSString *name;

/// Item type.
///
/// @discussion See enum @c item_types in mmo.hpp
@property (nonatomic) NSInteger type;

/// Weapon, Ammo or Card type.
///
/// @discussion See enum @c weapon_type in pc.hpp
/// @discussion See enum @c e_ammo_type in pc.hpp
/// @discussion See enum @c e_card_type in pc.hpp
@property (nonatomic) NSInteger subType;

/// Buying price. When not specified, becomes double the sell price.
@property (nonatomic) NSInteger buy;

/// Selling price. When not specified, becomes half the buy price.
@property (nonatomic) NSInteger sell;

/// Item weight. Each 10 is 1 weight.
@property (nonatomic) NSInteger weight;

/// Weapon's attack.
@property (nonatomic) NSInteger attack;

/// Weapon's magic attack.
@property (nonatomic) NSInteger magicAttack;

/// Armor's defense.
@property (nonatomic) NSInteger defense;

/// Weapon's attack range.
@property (nonatomic) NSInteger range;

/// Available slots in item.
@property (nonatomic) NSInteger slots;

/// Jobs that can equip the item.
///
/// @discussion See enum @c e_mapid in map.hpp
@property (nonatomic) NSArray<NSNumber *> *jobs;

/// Upper class types that can equip the item.
///
/// @discussion See enum @c e_item_job in itemdb.hpp
@property (nonatomic) NSUInteger classes;

/// Gender that can equip the item.
///
/// @discussion See enum @c e_sex in mmo.hpp
@property (nonatomic) NSInteger gender;

/// Equipment's placement.
///
/// @discussion See enum @c equip_pos in mmo.hpp
@property (nonatomic) NSUInteger locations;

/// Weapon level.
@property (nonatomic) NSInteger weaponLevel;

/// Armor level.
@property (nonatomic) NSInteger armorLevel;

/// Minimum required level to equip.
@property (nonatomic) NSInteger equipLevelMin;

/// Maximum level that can equip.
@property (nonatomic) NSInteger equipLevelMax;

/// If the item can be refined.
@property (nonatomic) BOOL refineable;

/// If the item can be graded.
@property (nonatomic) BOOL gradable;

/// View sprite of an item.
@property (nonatomic) NSInteger view;

/// Another item's AegisName that will be sent to the client instead of this item's AegisName.
@property (nonatomic, copy, nullable) NSString *aliasName;

/// Item flags.
@property (nonatomic) RAItemFlags *flags;

/// Item use delay.
@property (nonatomic) RAItemDelay *delay;

/// Item stack amount.
@property (nonatomic) RAItemStack *stack;

/// Conditions when the item is unusable.
@property (nonatomic) RAItemNoUse *noUse;

/// Trade restrictions.
@property (nonatomic) RAItemTrade *trade;

/// Script to execute when the item is used/equipped.
@property (nonatomic, copy, nullable) NSString *script;

/// Script to execute when the item is equipped.
@property (nonatomic, copy, nullable) NSString *equipScript;

/// Script to execute when the item is unequipped or when a rental item expires.
@property (nonatomic, copy, nullable) NSString *unEquipScript;

@end

@interface RAItemFlags : NSObject

/// If the item is available for Buyingstores.
@property (nonatomic) BOOL buyingStore;

/// If the item is a Dead Branch.
@property (nonatomic) BOOL deadBranch;

/// If the item is part of a container.
@property (nonatomic) BOOL container;

/// If the item is a unique stack.
@property (nonatomic) BOOL uniqueId;

/// If the item is bound to the character upon equipping.
@property (nonatomic) BOOL bindOnEquip;

/// If the item has a special announcement to self on drop.
@property (nonatomic) BOOL dropAnnounce;

/// If the item is consumed on use.
@property (nonatomic) BOOL noConsume;

/// If the item has a special effect on the ground when dropped by a monster.
///
/// @discussion See enum @c e_item_drop_effect in itemdb.hpp
@property (nonatomic) NSInteger dropEffect;

@end

@interface RAItemDelay : NSObject

/// Duration of delay in seconds.
@property (nonatomic) NSInteger duration;

/// Status Change used to track delay.
///
/// @discussion See enum @c sc_type in status.hpp
@property (nonatomic) NSInteger status;

@end

@interface RAItemStack : NSObject

/// Maximum amount that can be stacked.
@property (nonatomic) NSInteger amount;

/// If the stack is applied to player's inventory.
@property (nonatomic) BOOL inventory;

/// If the stack is applied to the player's cart.
@property (nonatomic) BOOL cart;

/// If the stack is applied to the player's storage.
@property (nonatomic) BOOL storage;

/// If the stack is applied to the player's guild storage.
@property (nonatomic) BOOL guildStorage;

@end

@interface RAItemNoUse : NSObject

/// Group level to override these conditions.
@property (nonatomic) NSInteger override;

/// If the item can not be used while sitting.
@property (nonatomic) BOOL sitting;

@end

@interface RAItemTrade : NSObject

/// Group level to override these conditions.
@property (nonatomic) NSInteger override;

/// If the item can not be dropped.
@property (nonatomic) BOOL noDrop;

/// If the item can not be traded.
@property (nonatomic) BOOL noTrade;

/// If the item can not be traded to the player's partner.
@property (nonatomic) BOOL tradePartner;

/// If the item can not be sold.
@property (nonatomic) BOOL noSell;

/// If the item can not be put in a cart.
@property (nonatomic) BOOL noCart;

/// If the item can not be put in a storage.
@property (nonatomic) BOOL noStorage;

/// If the item can not be put in a guild storage.
@property (nonatomic) BOOL noGuildStorage;

/// If the item can not be put in a mail.
@property (nonatomic) BOOL noMail;

/// If the item can not be put in an auction.
@property (nonatomic) BOOL noAuction;

@end

NS_ASSUME_NONNULL_END
