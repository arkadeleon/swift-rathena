//
//  RAItem2.h
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RAItemFlags2;
@class RAItemDelay2;
@class RAItemStack2;
@class RAItemNoUse2;
@class RAItemTrade2;

@interface RAItem2 : NSObject

/// Item ID.
@property (nonatomic) NSInteger itemID;

/// Server name to reference the item in scripts and lookups, should use no spaces.
@property (nonatomic, copy) NSString *aegisName;

/// Name in English for displaying as output.
@property (nonatomic, copy) NSString *name;

/// Item type. (Default: Etc)
@property (nonatomic) NSInteger type;

/// Weapon, Ammo or Card type. (Default: 0)
@property (nonatomic) NSInteger subType;

/// Buying price. When not specified, becomes double the sell price. (Default: 0)
@property (nonatomic) NSInteger buy;

/// Selling price. When not specified, becomes half the buy price. (Default: 0)
@property (nonatomic) NSInteger sell;

/// Item weight. Each 10 is 1 weight. (Default: 0)
@property (nonatomic) NSInteger weight;

/// Weapon's attack. (Default: 0)
@property (nonatomic) NSInteger attack;

/// Weapon's magic attack. (Default: 0)
@property (nonatomic) NSInteger magicAttack;

/// Armor's defense. (Default: 0)
@property (nonatomic) NSInteger defense;

/// Weapon's attack range. (Default: 0)
@property (nonatomic) NSInteger range;

/// Available slots in item. (Default: 0)
@property (nonatomic) NSInteger slots;

/// Jobs that can equip the item. (Map default is 'All: true')
@property (nonatomic) NSUInteger jobs11;
@property (nonatomic) NSUInteger jobs21;
@property (nonatomic) NSUInteger jobs22;

/// Upper class types that can equip the item. (Map default is 'All: true')
@property (nonatomic) NSInteger classes;

/// Gender that can equip the item. (Default: Both)
@property (nonatomic) NSInteger gender;

/// Equipment's placement. (Default: None)
@property (nonatomic) NSInteger locations;

/// Weapon level. (Default: 1 for Weapons)
@property (nonatomic) NSInteger weaponLevel;

/// Armor level. (Default: 1 for Armors)
@property (nonatomic) NSInteger armorLevel;

/// Minimum required level to equip. (Default: 0)
@property (nonatomic) NSInteger equipLevelMin;

/// Maximum level that can equip. (Default: 0)
@property (nonatomic) NSInteger equipLevelMax;

/// If the item can be refined. (Default: false)
@property (nonatomic) BOOL refineable;

/// If the item can be graded. (Default: false)
@property (nonatomic) BOOL gradable;

/// View sprite of an item. (Default: 0)
@property (nonatomic) NSInteger view;

/// Another item's AegisName that will be sent to the client instead of this item's AegisName. (Default: null)
@property (nonatomic, copy, nullable) NSString *aliasName;

/// Item flags. (Default: null)
@property (nonatomic) RAItemFlags2 *flags;

/// Item use delay. (Default: null)
@property (nonatomic) RAItemDelay2 *delay;

/// Item stack amount. (Default: null)
@property (nonatomic) RAItemStack2 *stack;

/// Conditions when the item is unusable. (Default: null)
@property (nonatomic) RAItemNoUse2 *noUse;

/// Trade restrictions. (Default: null)
@property (nonatomic) RAItemTrade2 *trade;

/// Script to execute when the item is used/equipped. (Default: null)
@property (nonatomic, copy, nullable) NSString *script;

/// Script to execute when the item is equipped. (Default: null)
@property (nonatomic, copy, nullable) NSString *equipScript;

/// Script to execute when the item is unequipped or when a rental item expires. (Default: null)
@property (nonatomic, copy, nullable) NSString *unEquipScript;

@end

@interface RAItemFlags2 : NSObject

/// If the item is available for Buyingstores. (Default: false)
@property (nonatomic) BOOL buyingStore;

/// If the item is a Dead Branch. (Default: false)
@property (nonatomic) BOOL deadBranch;

/// If the item is part of a container. (Default: false)
@property (nonatomic) BOOL container;

/// If the item is a unique stack. (Default: false)
@property (nonatomic) BOOL uniqueId;

/// If the item is bound to the character upon equipping. (Default: false)
@property (nonatomic) BOOL bindOnEquip;

/// If the item has a special announcement to self on drop. (Default: false)
@property (nonatomic) BOOL dropAnnounce;

/// If the item is consumed on use. (Default: false)
@property (nonatomic) BOOL noConsume;

/// If the item has a special effect on the ground when dropped by a monster. (Default: None)
@property (nonatomic) NSInteger dropEffect;

@end

@interface RAItemDelay2 : NSObject

/// Duration of delay in seconds.
@property (nonatomic) NSInteger duration;

/// Status Change used to track delay. (Default: None)
@property (nonatomic) NSInteger status;

@end

@interface RAItemStack2 : NSObject

/// Maximum amount that can be stacked.
@property (nonatomic) NSInteger amount;

/// If the stack is applied to player's inventory. (Default: true)
@property (nonatomic) BOOL inventory;

/// If the stack is applied to the player's cart. (Default: false)
@property (nonatomic) BOOL cart;

/// If the stack is applied to the player's storage. (Default: false)
@property (nonatomic) BOOL storage;

/// If the stack is applied to the player's guild storage. (Default: false)
@property (nonatomic) BOOL guildStorage;

@end

@interface RAItemNoUse2 : NSObject

/// Group level to override these conditions. (Default: 100)
@property (nonatomic) NSInteger override;

/// If the item can not be used while sitting. (Default: false)
@property (nonatomic) BOOL sitting;

@end

@interface RAItemTrade2 : NSObject

/// Group level to override these conditions. (Default: 100)
@property (nonatomic) NSInteger override;

/// If the item can not be dropped. (Default: false)
@property (nonatomic) BOOL noDrop;

/// If the item can not be traded. (Default: false)
@property (nonatomic) BOOL noTrade;

/// If the item can not be traded to the player's partner. (Default: false)
@property (nonatomic) BOOL tradePartner;

/// If the item can not be sold. (Default: false)
@property (nonatomic) BOOL noSell;

/// If the item can not be put in a cart. (Default: false)
@property (nonatomic) BOOL noCart;

/// If the item can not be put in a storage. (Default: false)
@property (nonatomic) BOOL noStorage;

/// If the item can not be put in a guild storage. (Default: false)
@property (nonatomic) BOOL noGuildStorage;

/// If the item can not be put in a mail. (Default: false)
@property (nonatomic) BOOL noMail;

/// If the item can not be put in an auction. (Default: false)
@property (nonatomic) BOOL noAuction;

@end

NS_ASSUME_NONNULL_END
