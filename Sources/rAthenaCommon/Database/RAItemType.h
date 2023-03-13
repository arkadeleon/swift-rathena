//
//  RAItemType.h
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAItemType : NSObject

@property (nonatomic, class, readonly) RAItemType *healing;
@property (nonatomic, class, readonly) RAItemType *unknown;
@property (nonatomic, class, readonly) RAItemType *usable;
@property (nonatomic, class, readonly) RAItemType *etc;
@property (nonatomic, class, readonly) RAItemType *armor;
@property (nonatomic, class, readonly) RAItemType *weapon;
@property (nonatomic, class, readonly) RAItemType *card;
@property (nonatomic, class, readonly) RAItemType *petEgg;
@property (nonatomic, class, readonly) RAItemType *petArmor;
@property (nonatomic, class, readonly) RAItemType *unknown2;
@property (nonatomic, class, readonly) RAItemType *ammo;
@property (nonatomic, class, readonly) RAItemType *delayConsume;
@property (nonatomic, class, readonly) RAItemType *shadowGear;
@property (nonatomic, class, readonly) RAItemType *cash;

@property (nonatomic) NSInteger typeID;
@property (nonatomic, copy) NSString *aegisName;
@property (nonatomic, copy) NSString *name;

+ (nullable instancetype)itemTypeWithAegisName:(NSString *)aegisName;

@end

NS_ASSUME_NONNULL_END
