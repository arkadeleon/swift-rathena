//
//  RAItem.h
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import <Foundation/Foundation.h>
#import "YYModel/YYModel.h"

@class RAItemType;
@class RAItemSubType;

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, RAItemJob) {
    RAItemJobAcolyte        = 1 << 0,
    RAItemJobAlchemist      = 1 << 1,
    RAItemJobArcher         = 1 << 2,
    RAItemJobAssassin       = 1 << 3,
    RAItemJobBardDancer     = 1 << 4,
    RAItemJobBlacksmith     = 1 << 5,
    RAItemJobCrusader       = 1 << 6,
    RAItemJobGunslinger     = 1 << 7,
    RAItemJobHunter         = 1 << 8,
    RAItemJobKagerouOboro   = 1 << 9,
    RAItemJobKnight         = 1 << 10,
    RAItemJobMage           = 1 << 11,
    RAItemJobMerchant       = 1 << 12,
    RAItemJobMonk           = 1 << 13,
    RAItemJobNinja          = 1 << 14,
    RAItemJobNovice         = 1 << 15,
    RAItemJobPriest         = 1 << 16,
    RAItemJobRebellion      = 1 << 17,
    RAItemJobRogue          = 1 << 18,
    RAItemJobSage           = 1 << 19,
    RAItemJobSoulLinker     = 1 << 20,
    RAItemJobStarGladiator  = 1 << 21,
    RAItemJobSummoner       = 1 << 22,
    RAItemJobSuperNovice    = 1 << 23,
    RAItemJobSwordman       = 1 << 24,
    RAItemJobTaekwon        = 1 << 25,
    RAItemJobThief          = 1 << 26,
    RAItemJobWizard         = 1 << 27,
    RAItemJobAll            = (RAItemJobAcolyte | RAItemJobAlchemist | RAItemJobArcher | RAItemJobAssassin | RAItemJobBardDancer | RAItemJobBlacksmith | RAItemJobCrusader | RAItemJobGunslinger | RAItemJobHunter | RAItemJobKagerouOboro | RAItemJobKnight | RAItemJobMage | RAItemJobMerchant | RAItemJobMonk | RAItemJobNinja | RAItemJobNovice | RAItemJobPriest | RAItemJobRebellion | RAItemJobRogue | RAItemJobSage | RAItemJobSoulLinker | RAItemJobStarGladiator | RAItemJobSummoner | RAItemJobSuperNovice | RAItemJobSwordman | RAItemJobTaekwon | RAItemJobThief | RAItemJobWizard),
};

typedef NS_OPTIONS(NSUInteger, RAItemClass) {
    RAItemClassNormal       = 1 << 0,
    RAItemClassUpper        = 1 << 1,
    RAItemClassBaby         = 1 << 2,
    RAItemClassThird        = 1 << 3,
    RAItemClassThirdUpper   = 1 << 4,
    RAItemClassThirdBaby    = 1 << 5,
    RAItemClassFourth       = 1 << 6,
    RAItemClassAllUpper     = 1 << 7,
    RAItemClassAllBaby      = 1 << 8,
    RAItemClassAllThird     = 1 << 9,
    RAItemClassAll          = (RAItemClassNormal | RAItemClassUpper | RAItemClassBaby | RAItemClassThird | RAItemClassThirdUpper | RAItemClassThirdBaby | RAItemClassFourth | RAItemClassAllUpper | RAItemClassAllBaby | RAItemClassAllThird),
};

typedef NS_ENUM(NSInteger, RAItemGender) {
    RAItemGenderFemale,
    RAItemGenderMale,
    RAItemGenderBoth,
};

typedef NS_OPTIONS(NSUInteger, RAItemLocation) {
    RAItemLocationHeadTop               = 1 << 0,
    RAItemLocationHeadMid               = 1 << 1,
    RAItemLocationHeadLow               = 1 << 2,
    RAItemLocationArmor                 = 1 << 3,
    RAItemLocationRightHand             = 1 << 4,
    RAItemLocationLeftHand              = 1 << 5,
    RAItemLocationGarment               = 1 << 6,
    RAItemLocationShoes                 = 1 << 7,
    RAItemLocationRightAccessory        = 1 << 8,
    RAItemLocationLeftAccessory         = 1 << 9,
    RAItemLocationCostumeHeadTop        = 1 << 10,
    RAItemLocationCostumeHeadMid        = 1 << 11,
    RAItemLocationCostumeHeadLow        = 1 << 12,
    RAItemLocationCostumeGarment        = 1 << 13,
    RAItemLocationAmmo                  = 1 << 14,
    RAItemLocationShadowArmor           = 1 << 15,
    RAItemLocationShadowWeapon          = 1 << 16,
    RAItemLocationShadowShield          = 1 << 17,
    RAItemLocationShadowShoes           = 1 << 18,
    RAItemLocationShadowRightAccessory  = 1 << 19,
    RAItemLocationShadowLeftAccessory   = 1 << 20,
    RAItemLocationBothHand              = 1 << 21,
    RAItemLocationBothAccessory         = 1 << 22,
};

@class RAItemFlags;
@class RAItemDelay;
@class RAItemStack;
@class RAItemNoUse;
@class RAItemTrade;

@interface RAItem : NSObject <YYModel>

/// Item ID.
@property (nonatomic) NSInteger itemID;

/// Server name to reference the item in scripts and lookups, should use no spaces.
@property (nonatomic, copy) NSString *aegisName;

/// Name in English for displaying as output.
@property (nonatomic, copy) NSString *name;

/// Item type. (Default: Etc)
@property (nonatomic) RAItemType *type;

/// Weapon, Ammo or Card type. (Default: 0)
@property (nonatomic, nullable) RAItemSubType *subType;

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
@property (nonatomic) RAItemJob jobs;

/// Upper class types that can equip the item. (Map default is 'All: true')
@property (nonatomic) RAItemClass classes;

/// Gender that can equip the item. (Default: Both)
@property (nonatomic) RAItemGender gender;

/// Equipment's placement. (Default: None)
@property (nonatomic) RAItemLocation locations;

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
@property (nonatomic, nullable) RAItemFlags *flags;

/// Item use delay. (Default: null)
@property (nonatomic, nullable) RAItemDelay *delay;

/// Item stack amount. (Default: null)
@property (nonatomic, nullable) RAItemStack *stack;

/// Conditions when the item is unusable. (Default: null)
@property (nonatomic, nullable) RAItemNoUse *noUse;

/// Trade restrictions. (Default: null)
@property (nonatomic, nullable) RAItemTrade *trade;

/// Script to execute when the item is used/equipped. (Default: null)
@property (nonatomic, copy, nullable) NSString *script;

/// Script to execute when the item is equipped. (Default: null)
@property (nonatomic, copy, nullable) NSString *equipScript;

/// Script to execute when the item is unequipped or when a rental item expires. (Default: null)
@property (nonatomic, copy, nullable) NSString *unEquipScript;

@end

@interface RAItemFlags : NSObject <YYModel>

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
@property (nonatomic, copy, nullable) NSString *dropEffect;

@end

@interface RAItemDelay : NSObject <YYModel>

/// Duration of delay in seconds.
@property (nonatomic) NSInteger duration;

/// Status Change used to track delay. (Default: None)
@property (nonatomic, copy, nullable) NSString *status;

@end

@interface RAItemStack : NSObject <YYModel>

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

@interface RAItemNoUse : NSObject <YYModel>

/// Group level to override these conditions. (Default: 100)
@property (nonatomic) NSInteger override;

/// If the item can not be used while sitting. (Default: false)
@property (nonatomic) BOOL sitting;

@end

@interface RAItemTrade : NSObject <YYModel>

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
