//
//  RAJob.m
//  rAthena
//
//  Created by Leon Li on 2023/3/8.
//

#import "RAJob.h"
#include "common/mmo.hpp"

@implementation RAJob

+ (RAJob *)novice {
    static RAJob *novice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        novice = [[RAJob alloc] init];
        novice.value = JOB_NOVICE;
        novice.name = @"Novice";
        novice.englishName = @"Novice";
    });
    return novice;
}

+ (RAJob *)swordman {
    static RAJob *swordman = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swordman = [[RAJob alloc] init];
        swordman.value = JOB_SWORDMAN;
        swordman.name = @"Swordman";
        swordman.englishName = @"Swordman";
    });
    return swordman;
}

+ (RAJob *)magician {
    static RAJob *magician = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        magician = [[RAJob alloc] init];
        magician.value = JOB_MAGE;
        magician.name = @"Mage";
        magician.englishName = @"Magician";
    });
    return magician;
}

+ (RAJob *)archer {
    static RAJob *archer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        archer = [[RAJob alloc] init];
        archer.value = JOB_ARCHER;
        archer.name = @"Archer";
        archer.englishName = @"Archer";
    });
    return archer;
}

+ (RAJob *)acolyte {
    static RAJob *acolyte = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        acolyte = [[RAJob alloc] init];
        acolyte.value = JOB_ACOLYTE;
        acolyte.name = @"Acolyte";
        acolyte.englishName = @"Acolyte";
    });
    return acolyte;
}

+ (RAJob *)merchant {
    static RAJob *merchant = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        merchant = [[RAJob alloc] init];
        merchant.value = JOB_MERCHANT;
        merchant.name = @"Merchant";
        merchant.englishName = @"Merchant";
    });
    return merchant;
}

+ (RAJob *)thief {
    static RAJob *thief = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thief = [[RAJob alloc] init];
        thief.value = JOB_THIEF;
        thief.name = @"Thief";
        thief.englishName = @"Thief";
    });
    return thief;
}

+ (RAJob *)knight {
    static RAJob *knight = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        knight = [[RAJob alloc] init];
        knight.value = JOB_KNIGHT;
        knight.name = @"Knight";
        knight.englishName = @"Knight";
    });
    return knight;
}

+ (RAJob *)priest {
    static RAJob *priest = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        priest = [[RAJob alloc] init];
        priest.value = JOB_PRIEST;
        priest.name = @"Priest";
        priest.englishName = @"Priest";
    });
    return priest;
}

+ (RAJob *)wizard {
    static RAJob *wizard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        wizard = [[RAJob alloc] init];
        wizard.value = JOB_WIZARD;
        wizard.name = @"Wizard";
        wizard.englishName = @"Wizard";
    });
    return wizard;
}

+ (RAJob *)blacksmith {
    static RAJob *blacksmith = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        blacksmith = [[RAJob alloc] init];
        blacksmith.value = JOB_BLACKSMITH;
        blacksmith.name = @"Blacksmith";
        blacksmith.englishName = @"Blacksmith";
    });
    return blacksmith;
}

+ (RAJob *)hunter {
    static RAJob *hunter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hunter = [[RAJob alloc] init];
        hunter.value = JOB_HUNTER;
        hunter.name = @"Hunter";
        hunter.englishName = @"Hunter";
    });
    return hunter;
}

+ (RAJob *)assassin {
    static RAJob *assassin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        assassin = [[RAJob alloc] init];
        assassin.value = JOB_ASSASSIN;
        assassin.name = @"Assassin";
        assassin.englishName = @"Assassin";
    });
    return assassin;
}

+ (RAJob *)knight2 {
    static RAJob *knight2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        knight2 = [[RAJob alloc] init];
        knight2.value = JOB_KNIGHT2;
        knight2.name = @"Knight2";
        knight2.englishName = @"Knight";
    });
    return knight2;
}

+ (RAJob *)crusader {
    static RAJob *crusader = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        crusader = [[RAJob alloc] init];
        crusader.value = JOB_CRUSADER;
        crusader.name = @"Crusader";
        crusader.englishName = @"Crusader";
    });
    return crusader;
}

+ (RAJob *)monk {
    static RAJob *monk = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        monk = [[RAJob alloc] init];
        monk.value = JOB_MONK;
        monk.name = @"Monk";
        monk.englishName = @"Monk";
    });
    return monk;
}

+ (RAJob *)sage {
    static RAJob *sage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sage = [[RAJob alloc] init];
        sage.value = JOB_SAGE;
        sage.name = @"Sage";
        sage.englishName = @"Sage";
    });
    return sage;
}

+ (RAJob *)rogue {
    static RAJob *rogue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rogue = [[RAJob alloc] init];
        rogue.value = JOB_ROGUE;
        rogue.name = @"Rogue";
        rogue.englishName = @"Rogue";
    });
    return rogue;
}

+ (RAJob *)alchemist {
    static RAJob *alchemist = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alchemist = [[RAJob alloc] init];
        alchemist.value = JOB_ALCHEMIST;
        alchemist.name = @"Alchemist";
        alchemist.englishName = @"Alchemist";
    });
    return alchemist;
}

+ (RAJob *)bard {
    static RAJob *bard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bard = [[RAJob alloc] init];
        bard.value = JOB_BARD;
        bard.name = @"Bard";
        bard.englishName = @"Bard";
    });
    return bard;
}

+ (RAJob *)dancer {
    static RAJob *dancer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dancer = [[RAJob alloc] init];
        dancer.value = JOB_DANCER;
        dancer.name = @"Dancer";
        dancer.englishName = @"Dancer";
    });
    return dancer;
}

+ (RAJob *)crusader2 {
    static RAJob *crusader2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        crusader2 = [[RAJob alloc] init];
        crusader2.value = JOB_CRUSADER2;
        crusader2.name = @"Crusader2";
        crusader2.englishName = @"Crusader";
    });
    return crusader2;
}

+ (RAJob *)wedding {
    static RAJob *wedding = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        wedding = [[RAJob alloc] init];
        wedding.value = JOB_WEDDING;
        wedding.name = @"Wedding";
        wedding.englishName = @"Wedding";
    });
    return wedding;
}

+ (RAJob *)superNovice {
    static RAJob *superNovice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        superNovice = [[RAJob alloc] init];
        superNovice.value = JOB_SUPER_NOVICE;
        superNovice.name = @"Supernovice";
        superNovice.englishName = @"Super Novice";
    });
    return superNovice;
}

+ (RAJob *)gunslinger {
    static RAJob *gunslinger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gunslinger = [[RAJob alloc] init];
        gunslinger.value = JOB_GUNSLINGER;
        gunslinger.name = @"Gunslinger";
        gunslinger.englishName = @"Gunslinger";
    });
    return gunslinger;
}

+ (RAJob *)ninja {
    static RAJob *ninja = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ninja = [[RAJob alloc] init];
        ninja.value = JOB_NINJA;
        ninja.name = @"Ninja";
        ninja.englishName = @"Ninja";
    });
    return ninja;
}

+ (RAJob *)christmas {
    static RAJob *christmas = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        christmas = [[RAJob alloc] init];
        christmas.value = JOB_XMAS;
        christmas.name = @"Christmas";
        christmas.englishName = @"Christmas";
    });
    return christmas;
}

+ (RAJob *)summer {
    static RAJob *summer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        summer = [[RAJob alloc] init];
        summer.value = JOB_SUMMER;
        summer.name = @"Summer";
        summer.englishName = @"Summer";
    });
    return summer;
}

+ (RAJob *)hanbok {
    static RAJob *hanbok = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hanbok = [[RAJob alloc] init];
        hanbok.value = JOB_HANBOK;
        hanbok.name = @"Hanbok";
        hanbok.englishName = @"Hanbok";
    });
    return hanbok;
}

+ (RAJob *)oktoberfest {
    static RAJob *oktoberfest = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oktoberfest = [[RAJob alloc] init];
        oktoberfest.value = JOB_OKTOBERFEST;
        oktoberfest.name = @"Oktoberfest";
        oktoberfest.englishName = @"Oktoberfest";
    });
    return oktoberfest;
}

+ (RAJob *)summer2 {
    static RAJob *summer2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        summer2 = [[RAJob alloc] init];
        summer2.value = JOB_SUMMER2;
        summer2.name = @"Summer2";
        summer2.englishName = @"Summer";
    });
    return summer2;
}

+ (RAJob *)highNovice {
    static RAJob *highNovice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        highNovice = [[RAJob alloc] init];
        highNovice.value = JOB_NOVICE_HIGH;
        highNovice.name = @"Novice_High";
        highNovice.englishName = @"High Novice";
    });
    return highNovice;
}

+ (RAJob *)highSwordman {
    static RAJob *highSwordman = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        highSwordman = [[RAJob alloc] init];
        highSwordman.value = JOB_SWORDMAN_HIGH;
        highSwordman.name = @"Swordman_High";
        highSwordman.englishName = @"High Swordsman";
    });
    return highSwordman;
}

+ (RAJob *)highMagician {
    static RAJob *highMagician = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        highMagician = [[RAJob alloc] init];
        highMagician.value = JOB_MAGE_HIGH;
        highMagician.name = @"Mage_High";
        highMagician.englishName = @"High Magician";
    });
    return highMagician;
}

+ (RAJob *)highArcher {
    static RAJob *highArcher = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        highArcher = [[RAJob alloc] init];
        highArcher.value = JOB_ARCHER_HIGH;
        highArcher.name = @"Archer_High";
        highArcher.englishName = @"High Archer";
    });
    return highArcher;
}

+ (RAJob *)highAcolyte {
    static RAJob *highAcolyte = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        highAcolyte = [[RAJob alloc] init];
        highAcolyte.value = JOB_ARCHER_HIGH;
        highAcolyte.name = @"Acolyte_High";
        highAcolyte.englishName = @"High Acolyte";
    });
    return highAcolyte;
}

+ (RAJob *)highMerchant {
    static RAJob *highMerchant = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        highMerchant = [[RAJob alloc] init];
        highMerchant.value = JOB_MERCHANT_HIGH;
        highMerchant.name = @"Merchant_High";
        highMerchant.englishName = @"High Merchant";
    });
    return highMerchant;
}

+ (RAJob *)highThief {
    static RAJob *highThief = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        highThief = [[RAJob alloc] init];
        highThief.value = JOB_THIEF_HIGH;
        highThief.name = @"Thief_High";
        highThief.englishName = @"High Thief";
    });
    return highThief;
}

+ (RAJob *)lordKnight {
    static RAJob *lordKnight = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lordKnight = [[RAJob alloc] init];
        lordKnight.value = JOB_LORD_KNIGHT;
        lordKnight.name = @"Lord_Knight";
        lordKnight.englishName = @"Lord Knight";
    });
    return lordKnight;
}

+ (RAJob *)highPriest {
    static RAJob *highPriest = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        highPriest = [[RAJob alloc] init];
        highPriest.value = JOB_HIGH_PRIEST;
        highPriest.name = @"High_Priest";
        highPriest.englishName = @"High Priest";
    });
    return highPriest;
}

+ (RAJob *)highWizard {
    static RAJob *highWizard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        highWizard = [[RAJob alloc] init];
        highWizard.value = JOB_HIGH_WIZARD;
        highWizard.name = @"High_Wizard";
        highWizard.englishName = @"High Wizard";
    });
    return highWizard;
}

+ (RAJob *)whitesmith {
    static RAJob *whitesmith = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        whitesmith = [[RAJob alloc] init];
        whitesmith.value = JOB_WHITESMITH;
        whitesmith.name = @"Whitesmith";
        whitesmith.englishName = @"Whitesmith";
    });
    return whitesmith;
}

+ (RAJob *)sniper {
    static RAJob *sniper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sniper = [[RAJob alloc] init];
        sniper.value = JOB_SNIPER;
        sniper.name = @"Sniper";
        sniper.englishName = @"Sniper";
    });
    return sniper;
}

+ (RAJob *)assassinCross {
    static RAJob *assassinCross = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        assassinCross = [[RAJob alloc] init];
        assassinCross.value = JOB_ASSASSIN_CROSS;
        assassinCross.name = @"Assassin_Cross";
        assassinCross.englishName = @"Assassin Cross";
    });
    return assassinCross;
}

+ (RAJob *)lordKnight2 {
    static RAJob *lordKnight2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lordKnight2 = [[RAJob alloc] init];
        lordKnight2.value = JOB_LORD_KNIGHT2;
        lordKnight2.name = @"Lord_Knight2";
        lordKnight2.englishName = @"Lord Knight";
    });
    return lordKnight2;
}

+ (RAJob *)paladin {
    static RAJob *paladin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        paladin = [[RAJob alloc] init];
        paladin.value = JOB_PALADIN;
        paladin.name = @"Paladin";
        paladin.englishName = @"Paladin";
    });
    return paladin;
}

+ (RAJob *)champion {
    static RAJob *champion = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        champion = [[RAJob alloc] init];
        champion.value = JOB_CHAMPION;
        champion.name = @"Champion";
        champion.englishName = @"Champion";
    });
    return champion;
}

+ (RAJob *)professor {
    static RAJob *professor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        professor = [[RAJob alloc] init];
        professor.value = JOB_PROFESSOR;
        professor.name = @"Professor";
        professor.englishName = @"Professor";
    });
    return professor;
}

+ (RAJob *)stalker {
    static RAJob *stalker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stalker = [[RAJob alloc] init];
        stalker.value = JOB_STALKER;
        stalker.name = @"Stalker";
        stalker.englishName = @"Stalker";
    });
    return stalker;
}

+ (RAJob *)creator {
    static RAJob *creator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        creator = [[RAJob alloc] init];
        creator.value = JOB_CREATOR;
        creator.name = @"Creator";
        creator.englishName = @"Creator";
    });
    return creator;
}

+ (RAJob *)clown {
    static RAJob *clown = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        clown = [[RAJob alloc] init];
        clown.value = JOB_CLOWN;
        clown.name = @"Clown";
        clown.englishName = @"Clown";
    });
    return clown;
}

+ (RAJob *)gypsy {
    static RAJob *gypsy = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gypsy = [[RAJob alloc] init];
        gypsy.value = JOB_GYPSY;
        gypsy.name = @"Gypsy";
        gypsy.englishName = @"Gypsy";
    });
    return gypsy;
}

+ (RAJob *)paladin2 {
    static RAJob *paladin2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        paladin2 = [[RAJob alloc] init];
        paladin2.value = JOB_PALADIN2;
        paladin2.name = @"Paladin2";
        paladin2.englishName = @"Paladin";
    });
    return paladin2;
}

+ (RAJob *)babyNovice {
    static RAJob *babyNovice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyNovice = [[RAJob alloc] init];
        babyNovice.value = JOB_BABY;
        babyNovice.name = @"Baby";
        babyNovice.englishName = @"Baby Novice";
    });
    return babyNovice;
}

+ (RAJob *)babySwordman {
    static RAJob *babySwordman = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babySwordman = [[RAJob alloc] init];
        babySwordman.value = JOB_BABY_SWORDMAN;
        babySwordman.name = @"Baby_Swordman";
        babySwordman.englishName = @"Baby Swordman";
    });
    return babySwordman;
}

+ (RAJob *)babyMagician {
    static RAJob *babyMagician = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyMagician = [[RAJob alloc] init];
        babyMagician.value = JOB_BABY_MAGE;
        babyMagician.name = @"Baby_Mage";
        babyMagician.englishName = @"Baby Magician";
    });
    return babyMagician;
}

+ (RAJob *)babyArcher {
    static RAJob *babyArcher = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyArcher = [[RAJob alloc] init];
        babyArcher.value = JOB_BABY_ARCHER;
        babyArcher.name = @"Baby_Archer";
        babyArcher.englishName = @"Baby Archer";
    });
    return babyArcher;
}

+ (RAJob *)babyAcolyte {
    static RAJob *babyAcolyte = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyAcolyte = [[RAJob alloc] init];
        babyAcolyte.value = JOB_BABY_ACOLYTE;
        babyAcolyte.name = @"Baby_Acolyte";
        babyAcolyte.englishName = @"Baby Acolyte";
    });
    return babyAcolyte;
}

+ (RAJob *)babyMerchant {
    static RAJob *babyMerchant = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyMerchant = [[RAJob alloc] init];
        babyMerchant.value = JOB_BABY_MERCHANT;
        babyMerchant.name = @"Baby_Merchant";
        babyMerchant.englishName = @"Baby Merchant";
    });
    return babyMerchant;
}

+ (RAJob *)babyThief {
    static RAJob *babyThief = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyThief = [[RAJob alloc] init];
        babyThief.value = JOB_BABY_THIEF;
        babyThief.name = @"Baby_Thief";
        babyThief.englishName = @"Baby Thief";
    });
    return babyThief;
}

+ (RAJob *)babyKnight {
    static RAJob *babyKnight = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyKnight = [[RAJob alloc] init];
        babyKnight.value = JOB_BABY_KNIGHT;
        babyKnight.name = @"Baby_Knight";
        babyKnight.englishName = @"Baby Knight";
    });
    return babyKnight;
}

+ (RAJob *)babyPriest {
    static RAJob *babyPriest = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyPriest = [[RAJob alloc] init];
        babyPriest.value = JOB_BABY_PRIEST;
        babyPriest.name = @"Baby_Priest";
        babyPriest.englishName = @"Baby Priest";
    });
    return babyPriest;
}

+ (RAJob *)babyWizard {
    static RAJob *babyWizard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyWizard = [[RAJob alloc] init];
        babyWizard.value = JOB_BABY_WIZARD;
        babyWizard.name = @"Baby_Wizard";
        babyWizard.englishName = @"Baby Wizard";
    });
    return babyWizard;
}

+ (RAJob *)babyBlacksmith {
    static RAJob *babyBlacksmith = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyBlacksmith = [[RAJob alloc] init];
        babyBlacksmith.value = JOB_BABY_BLACKSMITH;
        babyBlacksmith.name = @"Baby_Blacksmith";
        babyBlacksmith.englishName = @"Baby Blacksmith";
    });
    return babyBlacksmith;
}

+ (RAJob *)babyHunter {
    static RAJob *babyHunter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyHunter = [[RAJob alloc] init];
        babyHunter.value = JOB_BABY_HUNTER;
        babyHunter.name = @"Baby_Hunter";
        babyHunter.englishName = @"Baby Hunter";
    });
    return babyHunter;
}

+ (RAJob *)babyAssassin {
    static RAJob *babyAssassin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyAssassin = [[RAJob alloc] init];
        babyAssassin.value = JOB_BABY_ASSASSIN;
        babyAssassin.name = @"Baby_Assassin";
        babyAssassin.englishName = @"Baby Assassin";
    });
    return babyAssassin;
}

+ (RAJob *)babyKnight2 {
    static RAJob *babyKnight2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyKnight2 = [[RAJob alloc] init];
        babyKnight2.value = JOB_BABY_KNIGHT2;
        babyKnight2.name = @"Baby_Knight2";
        babyKnight2.englishName = @"Baby Knight";
    });
    return babyKnight2;
}

+ (RAJob *)babyCrusader {
    static RAJob *babyCrusader = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyCrusader = [[RAJob alloc] init];
        babyCrusader.value = JOB_BABY_CRUSADER;
        babyCrusader.name = @"Baby_Crusader";
        babyCrusader.englishName = @"Baby Crusader";
    });
    return babyCrusader;
}

+ (RAJob *)babyMonk {
    static RAJob *babyMonk = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyMonk = [[RAJob alloc] init];
        babyMonk.value = JOB_BABY_MONK;
        babyMonk.name = @"Baby_Monk";
        babyMonk.englishName = @"Baby Monk";
    });
    return babyMonk;
}

+ (RAJob *)babySage {
    static RAJob *babySage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babySage = [[RAJob alloc] init];
        babySage.value = JOB_BABY_SAGE;
        babySage.name = @"Baby_Sage";
        babySage.englishName = @"Baby Sage";
    });
    return babySage;
}

+ (RAJob *)babyRogue {
    static RAJob *babyRogue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyRogue = [[RAJob alloc] init];
        babyRogue.value = JOB_BABY_ROGUE;
        babyRogue.name = @"Baby_Rogue";
        babyRogue.englishName = @"Baby Rogue";
    });
    return babyRogue;
}

+ (RAJob *)babyAlchemist {
    static RAJob *babyAlchemist = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyAlchemist = [[RAJob alloc] init];
        babyAlchemist.value = JOB_BABY_ALCHEMIST;
        babyAlchemist.name = @"Baby_Alchemist";
        babyAlchemist.englishName = @"Baby Alchemist";
    });
    return babyAlchemist;
}

+ (RAJob *)babyBard {
    static RAJob *babyBard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyBard = [[RAJob alloc] init];
        babyBard.value = JOB_BABY_BARD;
        babyBard.name = @"Baby_Bard";
        babyBard.englishName = @"Baby Bard";
    });
    return babyBard;
}

+ (RAJob *)babyDancer {
    static RAJob *babyDancer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyDancer = [[RAJob alloc] init];
        babyDancer.value = JOB_BABY_DANCER;
        babyDancer.name = @"Baby_Dancer";
        babyDancer.englishName = @"Baby Dancer";
    });
    return babyDancer;
}

+ (RAJob *)babyCrusader2 {
    static RAJob *babyCrusader2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyCrusader2 = [[RAJob alloc] init];
        babyCrusader2.value = JOB_BABY_CRUSADER2;
        babyCrusader2.name = @"Baby_Crusader2";
        babyCrusader2.englishName = @"Baby Crusader";
    });
    return babyCrusader2;
}

+ (RAJob *)superBaby {
    static RAJob *superBaby = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        superBaby = [[RAJob alloc] init];
        superBaby.value = JOB_SUPER_BABY;
        superBaby.name = @"Super_Baby";
        superBaby.englishName = @"Super Baby";
    });
    return superBaby;
}

+ (RAJob *)taekwon {
    static RAJob *taekwon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        taekwon = [[RAJob alloc] init];
        taekwon.value = JOB_TAEKWON;
        taekwon.name = @"Taekwon";
        taekwon.englishName = @"Taekwon";
    });
    return taekwon;
}

+ (RAJob *)starGladiator {
    static RAJob *starGladiator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        starGladiator = [[RAJob alloc] init];
        starGladiator.value = JOB_STAR_GLADIATOR;
        starGladiator.name = @"Star_Gladiator";
        starGladiator.englishName = @"Star Gladiator";
    });
    return starGladiator;
}

+ (RAJob *)starGladiator2 {
    static RAJob *starGladiator2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        starGladiator2 = [[RAJob alloc] init];
        starGladiator2.value = JOB_STAR_GLADIATOR2;
        starGladiator2.name = @"Star_Gladiator2";
        starGladiator2.englishName = @"Star Gladiator";
    });
    return starGladiator2;
}

+ (RAJob *)soulLinker {
    static RAJob *soulLinker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        soulLinker = [[RAJob alloc] init];
        soulLinker.value = JOB_SOUL_LINKER;
        soulLinker.name = @"Soul_Linker";
        soulLinker.englishName = @"Soul Linker";
    });
    return soulLinker;
}

+ (RAJob *)gangsi {
    static RAJob *gangsi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gangsi = [[RAJob alloc] init];
        gangsi.value = JOB_GANGSI;
        gangsi.name = @"Gangsi";
        gangsi.englishName = @"Gangsi";
    });
    return gangsi;
}

+ (RAJob *)deathKnight {
    static RAJob *deathKnight = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deathKnight = [[RAJob alloc] init];
        deathKnight.value = JOB_DEATH_KNIGHT;
        deathKnight.name = @"Death_Knight";
        deathKnight.englishName = @"Death Knight";
    });
    return deathKnight;
}

+ (RAJob *)darkCollector {
    static RAJob *darkCollector = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        darkCollector = [[RAJob alloc] init];
        darkCollector.value = JOB_DARK_COLLECTOR;
        darkCollector.name = @"Dark_Collector";
        darkCollector.englishName = @"Dark Collector";
    });
    return darkCollector;
}

+ (RAJob *)runeKnight {
    static RAJob *runeKnight = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        runeKnight = [[RAJob alloc] init];
        runeKnight.value = JOB_RUNE_KNIGHT;
        runeKnight.name = @"Rune_Knight";
        runeKnight.englishName = @"Rune Knight";
    });
    return runeKnight;
}

+ (RAJob *)warlock {
    static RAJob *warlock = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        warlock = [[RAJob alloc] init];
        warlock.value = JOB_WARLOCK;
        warlock.name = @"Warlock";
        warlock.englishName = @"Warlock";
    });
    return warlock;
}

+ (RAJob *)ranger {
    static RAJob *ranger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ranger = [[RAJob alloc] init];
        ranger.value = JOB_RANGER;
        ranger.name = @"Ranger";
        ranger.englishName = @"Ranger";
    });
    return ranger;
}

+ (RAJob *)archBishop {
    static RAJob *archBishop = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        archBishop = [[RAJob alloc] init];
        archBishop.value = JOB_ARCH_BISHOP;
        archBishop.name = @"Arch_Bishop";
        archBishop.englishName = @"Arch Bishop";
    });
    return archBishop;
}

+ (RAJob *)mechanic {
    static RAJob *mechanic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mechanic = [[RAJob alloc] init];
        mechanic.value = JOB_MECHANIC;
        mechanic.name = @"Mechanic";
        mechanic.englishName = @"Mechanic";
    });
    return mechanic;
}

+ (RAJob *)guillotineCross {
    static RAJob *guillotineCross = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        guillotineCross = [[RAJob alloc] init];
        guillotineCross.value = JOB_GUILLOTINE_CROSS;
        guillotineCross.name = @"Guillotine_Cross";
        guillotineCross.englishName = @"Guillotine Cross";
    });
    return guillotineCross;
}

+ (RAJob *)runeKnightT {
    static RAJob *runeKnightT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        runeKnightT = [[RAJob alloc] init];
        runeKnightT.value = JOB_RUNE_KNIGHT_T;
        runeKnightT.name = @"Rune_Knight_T";
        runeKnightT.englishName = @"Rune Knight";
    });
    return runeKnightT;
}

+ (RAJob *)warlockT {
    static RAJob *warlockT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        warlockT = [[RAJob alloc] init];
        warlockT.value = JOB_WARLOCK_T;
        warlockT.name = @"Warlock_T";
        warlockT.englishName = @"Warlock";
    });
    return warlockT;
}

+ (RAJob *)rangerT {
    static RAJob *rangerT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rangerT = [[RAJob alloc] init];
        rangerT.value = JOB_RANGER_T;
        rangerT.name = @"Ranger_T";
        rangerT.englishName = @"Ranger";
    });
    return rangerT;
}

+ (RAJob *)archBishopT {
    static RAJob *archBishopT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        archBishopT = [[RAJob alloc] init];
        archBishopT.value = JOB_ARCH_BISHOP_T;
        archBishopT.name = @"Arch_Bishop_T";
        archBishopT.englishName = @"Arch Bishop";
    });
    return archBishopT;
}

+ (RAJob *)mechanicT {
    static RAJob *mechanicT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mechanicT = [[RAJob alloc] init];
        mechanicT.value = JOB_MECHANIC_T;
        mechanicT.name = @"Mechanic_T";
        mechanicT.englishName = @"Mechanic";
    });
    return mechanicT;
}

+ (RAJob *)guillotineCrossT {
    static RAJob *guillotineCrossT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        guillotineCrossT = [[RAJob alloc] init];
        guillotineCrossT.value = JOB_GUILLOTINE_CROSS_T;
        guillotineCrossT.name = @"Guillotine_Cross_T";
        guillotineCrossT.englishName = @"Guillotine Cross";
    });
    return guillotineCrossT;
}

+ (RAJob *)royalGuard {
    static RAJob *royalGuard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        royalGuard = [[RAJob alloc] init];
        royalGuard.value = JOB_ROYAL_GUARD;
        royalGuard.name = @"Royal_Guard";
        royalGuard.englishName = @"Royal Guard";
    });
    return royalGuard;
}

+ (RAJob *)sorcerer {
    static RAJob *sorcerer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sorcerer = [[RAJob alloc] init];
        sorcerer.value = JOB_SORCERER;
        sorcerer.name = @"Sorcerer";
        sorcerer.englishName = @"Sorcerer";
    });
    return sorcerer;
}

+ (RAJob *)minstrel {
    static RAJob *minstrel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        minstrel = [[RAJob alloc] init];
        minstrel.value = JOB_MINSTREL;
        minstrel.name = @"Minstrel";
        minstrel.englishName = @"Minstrel";
    });
    return minstrel;
}

+ (RAJob *)wanderer {
    static RAJob *wanderer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        wanderer = [[RAJob alloc] init];
        wanderer.value = JOB_WANDERER;
        wanderer.name = @"Wanderer";
        wanderer.englishName = @"Wanderer";
    });
    return wanderer;
}

+ (RAJob *)sura {
    static RAJob *sura = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sura = [[RAJob alloc] init];
        sura.value = JOB_SURA;
        sura.name = @"Sura";
        sura.englishName = @"Sura";
    });
    return sura;
}

+ (RAJob *)genetic {
    static RAJob *genetic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        genetic = [[RAJob alloc] init];
        genetic.value = JOB_GENETIC;
        genetic.name = @"Genetic";
        genetic.englishName = @"Genetic";
    });
    return genetic;
}

+ (RAJob *)shadowChaser {
    static RAJob *shadowChaser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shadowChaser = [[RAJob alloc] init];
        shadowChaser.value = JOB_SHADOW_CHASER;
        shadowChaser.name = @"Shadow_Chaser";
        shadowChaser.englishName = @"Shadow Chaser";
    });
    return shadowChaser;
}

+ (RAJob *)royalGuardT {
    static RAJob *royalGuardT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        royalGuardT = [[RAJob alloc] init];
        royalGuardT.value = JOB_ROYAL_GUARD_T;
        royalGuardT.name = @"Royal_Guard_T";
        royalGuardT.englishName = @"Royal Guard";
    });
    return royalGuardT;
}

+ (RAJob *)sorcererT {
    static RAJob *sorcererT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sorcererT = [[RAJob alloc] init];
        sorcererT.value = JOB_SORCERER_T;
        sorcererT.name = @"Sorcerer_T";
        sorcererT.englishName = @"Sorcerer";
    });
    return sorcererT;
}

+ (RAJob *)minstrelT {
    static RAJob *minstrelT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        minstrelT = [[RAJob alloc] init];
        minstrelT.value = JOB_MINSTREL_T;
        minstrelT.name = @"Minstrel_T";
        minstrelT.englishName = @"Minstrel";
    });
    return minstrelT;
}

+ (RAJob *)wandererT {
    static RAJob *wandererT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        wandererT = [[RAJob alloc] init];
        wandererT.value = JOB_WANDERER_T;
        wandererT.name = @"Wanderer_T";
        wandererT.englishName = @"Wanderer";
    });
    return wandererT;
}

+ (RAJob *)suraT {
    static RAJob *suraT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        suraT = [[RAJob alloc] init];
        suraT.value = JOB_SURA_T;
        suraT.name = @"Sura_T";
        suraT.englishName = @"Sura";
    });
    return suraT;
}

+ (RAJob *)geneticT {
    static RAJob *geneticT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        geneticT = [[RAJob alloc] init];
        geneticT.value = JOB_GENETIC_T;
        geneticT.name = @"Genetic_T";
        geneticT.englishName = @"Genetic";
    });
    return geneticT;
}

+ (RAJob *)shadowChaserT {
    static RAJob *shadowChaserT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shadowChaserT = [[RAJob alloc] init];
        shadowChaserT.value = JOB_SHADOW_CHASER_T;
        shadowChaserT.name = @"Shadow_Chaser_T";
        shadowChaserT.englishName = @"Shadow_Chaser";
    });
    return shadowChaserT;
}

+ (RAJob *)runeKnight2 {
    static RAJob *runeKnight2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        runeKnight2 = [[RAJob alloc] init];
        runeKnight2.value = JOB_RUNE_KNIGHT2;
        runeKnight2.name = @"Rune_Knight2";
        runeKnight2.englishName = @"Rune Knight";
    });
    return runeKnight2;
}

+ (RAJob *)runeKnightT2 {
    static RAJob *runeKnightT2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        runeKnightT2 = [[RAJob alloc] init];
        runeKnightT2.value = JOB_RUNE_KNIGHT_T2;
        runeKnightT2.name = @"Rune_Knight_T2";
        runeKnightT2.englishName = @"Rune Knight";
    });
    return runeKnightT2;
}

+ (RAJob *)royalGuard2 {
    static RAJob *royalGuard2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        royalGuard2 = [[RAJob alloc] init];
        royalGuard2.value = JOB_ROYAL_GUARD2;
        royalGuard2.name = @"Royal_Guard2";
        royalGuard2.englishName = @"Royal Guard";
    });
    return royalGuard2;
}

+ (RAJob *)royalGuardT2 {
    static RAJob *royalGuardT2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        royalGuardT2 = [[RAJob alloc] init];
        royalGuardT2.value = JOB_ROYAL_GUARD_T2;
        royalGuardT2.name = @"Royal_Guard_T2";
        royalGuardT2.englishName = @"Royal Guard";
    });
    return royalGuardT2;
}

+ (RAJob *)ranger2 {
    static RAJob *ranger2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ranger2 = [[RAJob alloc] init];
        ranger2.value = JOB_RANGER2;
        ranger2.name = @"Ranger2";
        ranger2.englishName = @"Ranger";
    });
    return ranger2;
}

+ (RAJob *)rangerT2 {
    static RAJob *rangerT2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rangerT2 = [[RAJob alloc] init];
        rangerT2.value = JOB_RANGER_T2;
        rangerT2.name = @"Ranger_T2";
        rangerT2.englishName = @"Ranger";
    });
    return rangerT2;
}

+ (RAJob *)mechanic2 {
    static RAJob *mechanic2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mechanic2 = [[RAJob alloc] init];
        mechanic2.value = JOB_MECHANIC2;
        mechanic2.name = @"Mechanic2";
        mechanic2.englishName = @"Mechanic";
    });
    return mechanic2;
}

+ (RAJob *)mechanicT2 {
    static RAJob *mechanicT2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mechanicT2 = [[RAJob alloc] init];
        mechanicT2.value = JOB_MECHANIC_T2;
        mechanicT2.name = @"Mechanic_T2";
        mechanicT2.englishName = @"Mechanic";
    });
    return mechanicT2;
}

+ (RAJob *)babyRuneKnight {
    static RAJob *babyRuneKnight = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyRuneKnight = [[RAJob alloc] init];
        babyRuneKnight.value = JOB_BABY_RUNE_KNIGHT;
        babyRuneKnight.name = @"Baby_Rune_Knight";
        babyRuneKnight.englishName = @"Baby Rune Knight";
    });
    return babyRuneKnight;
}

+ (RAJob *)babyWarlock {
    static RAJob *babyWarlock = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyWarlock = [[RAJob alloc] init];
        babyWarlock.value = JOB_BABY_WARLOCK;
        babyWarlock.name = @"Baby_Warlock";
        babyWarlock.englishName = @"Baby Warlock";
    });
    return babyWarlock;
}

+ (RAJob *)babyRanger {
    static RAJob *babyRanger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyRanger = [[RAJob alloc] init];
        babyRanger.value = JOB_BABY_RANGER;
        babyRanger.name = @"Baby_Ranger";
        babyRanger.englishName = @"Baby Ranger";
    });
    return babyRanger;
}

+ (RAJob *)babyArchBishop {
    static RAJob *babyArchBishop = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyArchBishop = [[RAJob alloc] init];
        babyArchBishop.value = JOB_BABY_ARCH_BISHOP;
        babyArchBishop.name = @"Baby_Arch_Bishop";
        babyArchBishop.englishName = @"Baby Arch Bishop";
    });
    return babyArchBishop;
}

+ (RAJob *)babyMechanic {
    static RAJob *babyMechanic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyMechanic = [[RAJob alloc] init];
        babyMechanic.value = JOB_BABY_MECHANIC;
        babyMechanic.name = @"Baby_Mechanic";
        babyMechanic.englishName = @"Baby Mechanic";
    });
    return babyMechanic;
}

+ (RAJob *)babyGuillotineCross {
    static RAJob *babyGuillotineCross = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyGuillotineCross = [[RAJob alloc] init];
        babyGuillotineCross.value = JOB_BABY_GUILLOTINE_CROSS;
        babyGuillotineCross.name = @"Baby_Guillotine_Cross";
        babyGuillotineCross.englishName = @"Baby Guillotine Cross";
    });
    return babyGuillotineCross;
}

+ (RAJob *)babyRoyalGuard {
    static RAJob *babyRoyalGuard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyRoyalGuard = [[RAJob alloc] init];
        babyRoyalGuard.value = JOB_BABY_ROYAL_GUARD;
        babyRoyalGuard.name = @"Baby_Royal_Guard";
        babyRoyalGuard.englishName = @"Baby Royal Guard";
    });
    return babyRoyalGuard;
}

+ (RAJob *)babySorcerer {
    static RAJob *babySorcerer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babySorcerer = [[RAJob alloc] init];
        babySorcerer.value = JOB_BABY_SORCERER;
        babySorcerer.name = @"Baby_Sorcerer";
        babySorcerer.englishName = @"Baby Sorcerer";
    });
    return babySorcerer;
}

+ (RAJob *)babyMinstrel {
    static RAJob *babyMinstrel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyMinstrel = [[RAJob alloc] init];
        babyMinstrel.value = JOB_BABY_MINSTREL;
        babyMinstrel.name = @"Baby_Minstrel";
        babyMinstrel.englishName = @"Baby Minstrel";
    });
    return babyMinstrel;
}

+ (RAJob *)babyWanderer {
    static RAJob *babyWanderer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyWanderer = [[RAJob alloc] init];
        babyWanderer.value = JOB_BABY_WANDERER;
        babyWanderer.name = @"Baby_Wanderer";
        babyWanderer.englishName = @"Baby Wanderer";
    });
    return babyWanderer;
}

+ (RAJob *)babySura {
    static RAJob *babySura = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babySura = [[RAJob alloc] init];
        babySura.value = JOB_BABY_SURA;
        babySura.name = @"Baby_Sura";
        babySura.englishName = @"Baby Sura";
    });
    return babySura;
}

+ (RAJob *)babyGenetic {
    static RAJob *babyGenetic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyGenetic = [[RAJob alloc] init];
        babyGenetic.value = JOB_BABY_GENETIC;
        babyGenetic.name = @"Baby_Mechanic";
        babyGenetic.englishName = @"Baby Mechanic";
    });
    return babyGenetic;
}

+ (RAJob *)babyShadowChaser {
    static RAJob *babyShadowChaser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyShadowChaser = [[RAJob alloc] init];
        babyShadowChaser.value = JOB_BABY_SHADOW_CHASER;
        babyShadowChaser.name = @"Baby_Shadow_Chaser";
        babyShadowChaser.englishName = @"Baby Shadow Chaser";
    });
    return babyShadowChaser;
}

+ (RAJob *)babyRuneKnight2 {
    static RAJob *babyRuneKnight2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyRuneKnight2 = [[RAJob alloc] init];
        babyRuneKnight2.value = JOB_BABY_RUNE_KNIGHT2;
        babyRuneKnight2.name = @"Baby_Rune_Knight2";
        babyRuneKnight2.englishName = @"Baby Rune Knight";
    });
    return babyRuneKnight2;
}

+ (RAJob *)babyRoyalGuard2 {
    static RAJob *babyRoyalGuard2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyRoyalGuard2 = [[RAJob alloc] init];
        babyRoyalGuard2.value = JOB_BABY_ROYAL_GUARD2;
        babyRoyalGuard2.name = @"Baby_Royal_Guard2";
        babyRoyalGuard2.englishName = @"Baby Royal Guard";
    });
    return babyRoyalGuard2;
}

+ (RAJob *)babyRanger2 {
    static RAJob *babyRanger2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyRanger2 = [[RAJob alloc] init];
        babyRanger2.value = JOB_BABY_RANGER2;
        babyRanger2.name = @"Baby_Ranger2";
        babyRanger2.englishName = @"Baby Ranger";
    });
    return babyRanger2;
}

+ (RAJob *)babyMechanic2 {
    static RAJob *babyMechanic2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyMechanic2 = [[RAJob alloc] init];
        babyMechanic2.value = JOB_BABY_MECHANIC2;
        babyMechanic2.name = @"Baby_Mechanic2";
        babyMechanic2.englishName = @"Baby Mechanic";
    });
    return babyMechanic2;
}

+ (RAJob *)expandedSuperNovice {
    static RAJob *expandedSuperNovice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        expandedSuperNovice = [[RAJob alloc] init];
        expandedSuperNovice.value = JOB_SUPER_NOVICE_E;
        expandedSuperNovice.name = @"Super_Novice_E";
        expandedSuperNovice.englishName = @"Expanded Super Novice";
    });
    return expandedSuperNovice;
}

+ (RAJob *)expandedSuperBaby {
    static RAJob *expandedSuperBaby = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        expandedSuperBaby = [[RAJob alloc] init];
        expandedSuperBaby.value = JOB_SUPER_BABY_E;
        expandedSuperBaby.name = @"Super_Baby_E";
        expandedSuperBaby.englishName = @"Expanded Super Baby";
    });
    return expandedSuperBaby;
}

+ (RAJob *)kagerou {
    static RAJob *kagerou = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kagerou = [[RAJob alloc] init];
        kagerou.value = JOB_KAGEROU;
        kagerou.name = @"Kagerou";
        kagerou.englishName = @"Kagerou";
    });
    return kagerou;
}

+ (RAJob *)oboro {
    static RAJob *oboro = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oboro = [[RAJob alloc] init];
        oboro.value = JOB_OBORO;
        oboro.name = @"Oboro";
        oboro.englishName = @"Oboro";
    });
    return oboro;
}

+ (RAJob *)rebellion {
    static RAJob *rebellion = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rebellion = [[RAJob alloc] init];
        rebellion.value = JOB_REBELLION;
        rebellion.name = @"Rebellion";
        rebellion.englishName = @"Rebellion";
    });
    return rebellion;
}

+ (RAJob *)summoner {
    static RAJob *summoner = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        summoner = [[RAJob alloc] init];
        summoner.value = JOB_SUMMONER;
        summoner.name = @"Summoner";
        summoner.englishName = @"Summoner";
    });
    return summoner;
}

+ (RAJob *)babySummoner {
    static RAJob *babySummoner = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babySummoner = [[RAJob alloc] init];
        babySummoner.value = JOB_BABY_SUMMONER;
        babySummoner.name = @"Baby_Summoner";
        babySummoner.englishName = @"Baby Summoner";
    });
    return babySummoner;
}

+ (RAJob *)babyNinja {
    static RAJob *babyNinja = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyNinja = [[RAJob alloc] init];
        babyNinja.value = JOB_BABY_NINJA;
        babyNinja.name = @"Baby_Ninja";
        babyNinja.englishName = @"Baby Ninja";
    });
    return babyNinja;
}

+ (RAJob *)babyKagerou {
    static RAJob *babyKagerou = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyKagerou = [[RAJob alloc] init];
        babyKagerou.value = JOB_BABY_KAGEROU;
        babyKagerou.name = @"Baby_Kagerou";
        babyKagerou.englishName = @"Baby Kagerou";
    });
    return babyKagerou;
}

+ (RAJob *)babyOboro {
    static RAJob *babyOboro = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyOboro = [[RAJob alloc] init];
        babyOboro.value = JOB_BABY_OBORO;
        babyOboro.name = @"Baby_Oboro";
        babyOboro.englishName = @"Baby Oboro";
    });
    return babyOboro;
}

+ (RAJob *)babyTaekwon {
    static RAJob *babyTaekwon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyTaekwon = [[RAJob alloc] init];
        babyTaekwon.value = JOB_BABY_TAEKWON;
        babyTaekwon.name = @"Baby_Taekwon";
        babyTaekwon.englishName = @"Baby Taekwon";
    });
    return babyTaekwon;
}

+ (RAJob *)babyStarGladiator {
    static RAJob *babyStarGladiator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyStarGladiator = [[RAJob alloc] init];
        babyStarGladiator.value = JOB_BABY_STAR_GLADIATOR;
        babyStarGladiator.name = @"Baby_Star_Gladiator";
        babyStarGladiator.englishName = @"Baby Star Gladiator";
    });
    return babyStarGladiator;
}

+ (RAJob *)babySoulLinker {
    static RAJob *babySoulLinker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babySoulLinker = [[RAJob alloc] init];
        babySoulLinker.value = JOB_BABY_SOUL_LINKER;
        babySoulLinker.name = @"Baby_Soul_Linker";
        babySoulLinker.englishName = @"Baby Soul Linker";
    });
    return babySoulLinker;
}

+ (RAJob *)babyGunslinger {
    static RAJob *babyGunslinger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyGunslinger = [[RAJob alloc] init];
        babyGunslinger.value = JOB_BABY_GUNSLINGER;
        babyGunslinger.name = @"Baby_Gunslinger";
        babyGunslinger.englishName = @"Baby Gunslinger";
    });
    return babyGunslinger;
}

+ (RAJob *)babyRebellion {
    static RAJob *babyRebellion = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyRebellion = [[RAJob alloc] init];
        babyRebellion.value = JOB_BABY_REBELLION;
        babyRebellion.name = @"Baby_Rebellion";
        babyRebellion.englishName = @"Baby Rebellion";
    });
    return babyRebellion;
}

+ (RAJob *)babyStarGladiator2 {
    static RAJob *babyStarGladiator2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyStarGladiator2 = [[RAJob alloc] init];
        babyStarGladiator2.value = JOB_BABY_STAR_GLADIATOR2;
        babyStarGladiator2.name = @"Baby_Star_Gladiator2";
        babyStarGladiator2.englishName = @"Baby Star Gladiator";
    });
    return babyStarGladiator2;
}

+ (RAJob *)starEmperor {
    static RAJob *starEmperor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        starEmperor = [[RAJob alloc] init];
        starEmperor.value = JOB_STAR_EMPEROR;
        starEmperor.name = @"Star_Emperor";
        starEmperor.englishName = @"Star Emperor";
    });
    return starEmperor;
}

+ (RAJob *)soulReaper {
    static RAJob *soulReaper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        soulReaper = [[RAJob alloc] init];
        soulReaper.value = JOB_SOUL_REAPER;
        soulReaper.name = @"Soul_Reaper";
        soulReaper.englishName = @"Soul Reaper";
    });
    return soulReaper;
}

+ (RAJob *)babyStarEmperor {
    static RAJob *babyStarEmperor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyStarEmperor = [[RAJob alloc] init];
        babyStarEmperor.value = JOB_BABY_STAR_EMPEROR;
        babyStarEmperor.name = @"Baby_Star_Emperor";
        babyStarEmperor.englishName = @"Baby Star Emperor";
    });
    return babyStarEmperor;
}

+ (RAJob *)babySoulReaper {
    static RAJob *babySoulReaper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babySoulReaper = [[RAJob alloc] init];
        babySoulReaper.value = JOB_BABY_SOUL_REAPER;
        babySoulReaper.name = @"Baby_Soul_Reaper";
        babySoulReaper.englishName = @"Baby Soul Reaper";
    });
    return babySoulReaper;
}

+ (RAJob *)starEmperor2 {
    static RAJob *starEmperor2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        starEmperor2 = [[RAJob alloc] init];
        starEmperor2.value = JOB_STAR_EMPEROR2;
        starEmperor2.name = @"Star_Emperor2";
        starEmperor2.englishName = @"Star Emperor";
    });
    return starEmperor2;
}

+ (RAJob *)babyStarEmperor2 {
    static RAJob *babyStarEmperor2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        babyStarEmperor2 = [[RAJob alloc] init];
        babyStarEmperor2.value = JOB_BABY_STAR_EMPEROR2;
        babyStarEmperor2.name = @"Baby_Star_Emperor2";
        babyStarEmperor2.englishName = @"Baby Star Emperor";
    });
    return babyStarEmperor2;
}

+ (RAJob *)dragonKnight {
    static RAJob *dragonKnight = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dragonKnight = [[RAJob alloc] init];
        dragonKnight.value = JOB_DRAGON_KNIGHT;
        dragonKnight.name = @"Dragon_Knight";
        dragonKnight.englishName = @"Dragon Knight";
    });
    return dragonKnight;
}

+ (RAJob *)meister {
    static RAJob *meister = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        meister = [[RAJob alloc] init];
        meister.value = JOB_MEISTER;
        meister.name = @"Meister";
        meister.englishName = @"Meister";
    });
    return meister;
}

+ (RAJob *)shadowCross {
    static RAJob *shadowCross = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shadowCross = [[RAJob alloc] init];
        shadowCross.value = JOB_SHADOW_CROSS;
        shadowCross.name = @"Shadow_Cross";
        shadowCross.englishName = @"Shadow Cross";
    });
    return shadowCross;
}

+ (RAJob *)archMage {
    static RAJob *archMage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        archMage = [[RAJob alloc] init];
        archMage.value = JOB_ARCH_MAGE;
        archMage.name = @"Arch_Mage";
        archMage.englishName = @"Arch Mage";
    });
    return archMage;
}

+ (RAJob *)cardinal {
    static RAJob *cardinal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cardinal = [[RAJob alloc] init];
        cardinal.value = JOB_CARDINAL;
        cardinal.name = @"Cardinal";
        cardinal.englishName = @"Cardinal";
    });
    return cardinal;
}

+ (RAJob *)windhawk {
    static RAJob *windhawk = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        windhawk = [[RAJob alloc] init];
        windhawk.value = JOB_WINDHAWK;
        windhawk.name = @"Windhawk";
        windhawk.englishName = @"Windhawk";
    });
    return windhawk;
}

+ (RAJob *)imperialGuard {
    static RAJob *imperialGuard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imperialGuard = [[RAJob alloc] init];
        imperialGuard.value = JOB_IMPERIAL_GUARD;
        imperialGuard.name = @"Imperial_Guard";
        imperialGuard.englishName = @"Imperial Guard";
    });
    return imperialGuard;
}

+ (RAJob *)biolo {
    static RAJob *biolo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        biolo = [[RAJob alloc] init];
        biolo.value = JOB_BIOLO;
        biolo.name = @"Biolo";
        biolo.englishName = @"Biolo";
    });
    return biolo;
}

+ (RAJob *)abyssChaser {
    static RAJob *abyssChaser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        abyssChaser = [[RAJob alloc] init];
        abyssChaser.value = JOB_ABYSS_CHASER;
        abyssChaser.name = @"Abyss_Chaser";
        abyssChaser.englishName = @"Abyss Chaser";
    });
    return abyssChaser;
}

+ (RAJob *)elementalMaster {
    static RAJob *elementalMaster = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        elementalMaster = [[RAJob alloc] init];
        elementalMaster.value = JOB_ELEMENTAL_MASTER;
        elementalMaster.name = @"Elemental_Master";
        elementalMaster.englishName = @"Elemental Master";
    });
    return elementalMaster;
}

+ (RAJob *)inquisitor {
    static RAJob *inquisitor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inquisitor = [[RAJob alloc] init];
        inquisitor.value = JOB_INQUISITOR;
        inquisitor.name = @"Inquisitor";
        inquisitor.englishName = @"Inquisitor";
    });
    return inquisitor;
}

+ (RAJob *)troubadour {
    static RAJob *troubadour = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        troubadour = [[RAJob alloc] init];
        troubadour.value = JOB_TROUBADOUR;
        troubadour.name = @"Troubadour";
        troubadour.englishName = @"Troubadour";
    });
    return troubadour;
}

+ (RAJob *)trouvere {
    static RAJob *trouvere = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        trouvere = [[RAJob alloc] init];
        trouvere.value = JOB_TROUVERE;
        trouvere.name = @"Trouvere";
        trouvere.englishName = @"Trouvere";
    });
    return trouvere;
}

+ (RAJob *)windhawk2 {
    static RAJob *windhawk2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        windhawk2 = [[RAJob alloc] init];
        windhawk2.value = JOB_WINDHAWK2;
        windhawk2.name = @"Windhawk2";
        windhawk2.englishName = @"Windhawk";
    });
    return windhawk2;
}

+ (RAJob *)meister2 {
    static RAJob *meister2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        meister2 = [[RAJob alloc] init];
        meister2.value = JOB_MEISTER2;
        meister2.name = @"Meister2";
        meister2.englishName = @"Meister";
    });
    return meister2;
}

+ (RAJob *)dragonKnight2 {
    static RAJob *dragonKnight2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dragonKnight2 = [[RAJob alloc] init];
        dragonKnight2.value = JOB_DRAGON_KNIGHT2;
        dragonKnight2.name = @"Dragon_Knight2";
        dragonKnight2.englishName = @"Dragon Knight";
    });
    return dragonKnight2;
}

+ (RAJob *)imperialGuard2 {
    static RAJob *imperialGuard2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imperialGuard2 = [[RAJob alloc] init];
        imperialGuard2.value = JOB_IMPERIAL_GUARD2;
        imperialGuard2.name = @"Imperial_Guard2";
        imperialGuard2.englishName = @"Imperial_Guard2";
    });
    return imperialGuard2;
}

+ (RAJob *)skyEmperor {
    static RAJob *skyEmperor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        skyEmperor = [[RAJob alloc] init];
        skyEmperor.value = JOB_SKY_EMPEROR;
        skyEmperor.name = @"Sky_Emperor";
        skyEmperor.englishName = @"Sky Emperor";
    });
    return skyEmperor;
}

+ (RAJob *)soulAscetic {
    static RAJob *soulAscetic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        soulAscetic = [[RAJob alloc] init];
        soulAscetic.value = JOB_SOUL_ASCETIC;
        soulAscetic.name = @"Soul_Ascetic";
        soulAscetic.englishName = @"Soul Ascetic";
    });
    return soulAscetic;
}

+ (RAJob *)shinkiro {
    static RAJob *shinkiro = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shinkiro = [[RAJob alloc] init];
        shinkiro.value = JOB_SHINKIRO;
        shinkiro.name = @"Shinkiro";
        shinkiro.englishName = @"Shinkiro";
    });
    return shinkiro;
}

+ (RAJob *)shiranui {
    static RAJob *shiranui = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shiranui = [[RAJob alloc] init];
        shiranui.value = JOB_SHIRANUI;
        shiranui.name = @"Shiranui";
        shiranui.englishName = @"Shiranui";
    });
    return shiranui;
}

+ (RAJob *)nightWatch {
    static RAJob *nightWatch = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nightWatch = [[RAJob alloc] init];
        nightWatch.value = JOB_NIGHT_WATCH;
        nightWatch.name = @"Night_Watch";
        nightWatch.englishName = @"Night Watch";
    });
    return nightWatch;
}

+ (RAJob *)hyperNovice {
    static RAJob *hyperNovice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hyperNovice = [[RAJob alloc] init];
        hyperNovice.value = JOB_HYPER_NOVICE;
        hyperNovice.name = @"Hyper_Novice";
        hyperNovice.englishName = @"Hyper Novice";
    });
    return hyperNovice;
}

+ (RAJob *)spiritHandler {
    static RAJob *spiritHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        spiritHandler = [[RAJob alloc] init];
        spiritHandler.value = JOB_SPIRIT_HANDLER;
        spiritHandler.name = @"Spirit_Handler";
        spiritHandler.englishName = @"Spirit Handler";
    });
    return spiritHandler;
}

+ (RAJob *)skyEmperor2 {
    static RAJob *skyEmperor2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        skyEmperor2 = [[RAJob alloc] init];
        skyEmperor2.value = JOB_SKY_EMPEROR2;
        skyEmperor2.name = @"Sky_Emperor2";
        skyEmperor2.englishName = @"Sky Emperor";
    });
    return skyEmperor2;
}

+ (NSArray<RAJob *> *)allCases {
    static NSArray<RAJob *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RAJob.novice,
            RAJob.swordman,
            RAJob.magician,
            RAJob.archer,
            RAJob.acolyte,
            RAJob.merchant,
            RAJob.thief,
            RAJob.knight,
            RAJob.priest,
            RAJob.wizard,
            RAJob.blacksmith,
            RAJob.hunter,
            RAJob.assassin,
            RAJob.knight2,
            RAJob.crusader,
            RAJob.monk,
            RAJob.sage,
            RAJob.rogue,
            RAJob.alchemist,
            RAJob.bard,
            RAJob.dancer,
            RAJob.crusader2,
            RAJob.wedding,
            RAJob.superNovice,
            RAJob.gunslinger,
            RAJob.ninja,
            RAJob.christmas,
            RAJob.summer,
            RAJob.hanbok,
            RAJob.oktoberfest,
            RAJob.summer2,

            RAJob.highNovice,
            RAJob.highSwordman,
            RAJob.highMagician,
            RAJob.highArcher,
            RAJob.highAcolyte,
            RAJob.highMerchant,
            RAJob.highThief,
            RAJob.lordKnight,
            RAJob.highPriest,
            RAJob.highWizard,
            RAJob.whitesmith,
            RAJob.sniper,
            RAJob.assassinCross,
            RAJob.lordKnight2,
            RAJob.paladin,
            RAJob.champion,
            RAJob.professor,
            RAJob.stalker,
            RAJob.creator,
            RAJob.clown,
            RAJob.gypsy,
            RAJob.paladin2,

            RAJob.babyNovice,
            RAJob.babySwordman,
            RAJob.babyMagician,
            RAJob.babyArcher,
            RAJob.babyAcolyte,
            RAJob.babyMerchant,
            RAJob.babyThief,
            RAJob.babyKnight,
            RAJob.babyPriest,
            RAJob.babyWizard,
            RAJob.babyBlacksmith,
            RAJob.babyHunter,
            RAJob.babyAssassin,
            RAJob.babyKnight2,
            RAJob.babyCrusader,
            RAJob.babyMonk,
            RAJob.babySage,
            RAJob.babyRogue,
            RAJob.babyAlchemist,
            RAJob.babyBard,
            RAJob.babyDancer,
            RAJob.babyCrusader2,
            RAJob.superBaby,

            RAJob.taekwon,
            RAJob.starGladiator,
            RAJob.starGladiator2,
            RAJob.soulLinker,

            RAJob.gangsi,
            RAJob.deathKnight,
            RAJob.darkCollector,

            RAJob.runeKnight,
            RAJob.warlock,
            RAJob.ranger,
            RAJob.archBishop,
            RAJob.mechanic,
            RAJob.guillotineCross,

            RAJob.runeKnightT,
            RAJob.warlockT,
            RAJob.rangerT,
            RAJob.archBishopT,
            RAJob.mechanicT,
            RAJob.guillotineCrossT,

            RAJob.royalGuard,
            RAJob.sorcerer,
            RAJob.minstrel,
            RAJob.wanderer,
            RAJob.sura,
            RAJob.genetic,
            RAJob.shadowChaser,

            RAJob.royalGuardT,
            RAJob.sorcererT,
            RAJob.minstrelT,
            RAJob.wandererT,
            RAJob.suraT,
            RAJob.geneticT,
            RAJob.shadowChaserT,

            RAJob.runeKnight2,
            RAJob.runeKnightT2,
            RAJob.royalGuard2,
            RAJob.royalGuardT2,
            RAJob.ranger2,
            RAJob.rangerT2,
            RAJob.mechanic2,
            RAJob.mechanicT2,

            RAJob.babyRuneKnight,
            RAJob.babyWarlock,
            RAJob.babyRanger,
            RAJob.babyArchBishop,
            RAJob.babyMechanic,
            RAJob.babyGuillotineCross,
            RAJob.babyRoyalGuard,
            RAJob.babySorcerer,
            RAJob.babyMinstrel,
            RAJob.babyWanderer,
            RAJob.babySura,
            RAJob.babyGenetic,
            RAJob.babyShadowChaser,

            RAJob.babyRuneKnight2,
            RAJob.babyRoyalGuard2,
            RAJob.babyRanger2,
            RAJob.babyMechanic2,

            RAJob.expandedSuperNovice,
            RAJob.expandedSuperBaby,

            RAJob.kagerou,
            RAJob.oboro,

            RAJob.rebellion,

            RAJob.summoner,

            RAJob.babySummoner,

            RAJob.babyNinja,
            RAJob.babyKagerou,
            RAJob.babyOboro,
            RAJob.babyTaekwon,
            RAJob.babyStarGladiator,
            RAJob.babySoulLinker,
            RAJob.babyGunslinger,
            RAJob.babyRebellion,

            RAJob.babyStarGladiator2,

            RAJob.starEmperor,
            RAJob.soulReaper,
            RAJob.babyStarEmperor,
            RAJob.babySoulReaper,
            RAJob.starEmperor2,
            RAJob.babyStarEmperor2,

            RAJob.dragonKnight,
            RAJob.meister,
            RAJob.shadowCross,
            RAJob.archMage,
            RAJob.cardinal,
            RAJob.windhawk,
            RAJob.imperialGuard,
            RAJob.biolo,
            RAJob.abyssChaser,
            RAJob.elementalMaster,
            RAJob.inquisitor,
            RAJob.troubadour,
            RAJob.trouvere,

            RAJob.windhawk2,
            RAJob.meister2,
            RAJob.dragonKnight2,
            RAJob.imperialGuard2,

            RAJob.skyEmperor,
            RAJob.soulAscetic,
            RAJob.shinkiro,
            RAJob.shiranui,
            RAJob.nightWatch,
            RAJob.hyperNovice,
            RAJob.spiritHandler,

            RAJob.skyEmperor2,
        ];
    });
    return allCases;
}

@end
