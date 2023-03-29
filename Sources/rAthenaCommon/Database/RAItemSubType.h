//
//  RAItemSubType.h
//  rAthena
//
//  Created by Leon Li on 2023/3/14.
//

#import <Foundation/Foundation.h>
#import "Enum/RAWeaponType.h"
#import "Enum/RAAmmoType.h"
#import "Enum/RACardType.h"

NS_ASSUME_NONNULL_BEGIN

@class RAItemType;
@protocol RAItemSubType;

extern id<RAItemSubType> _Nullable RAItemSubTypeFromName(NSString *name, RAItemType *type);

@protocol RAItemSubType <NSObject>

@end

@interface RAWeaponType (RAItemSubType) <RAItemSubType>

@end

@interface RAAmmoType (RAItemSubType) <RAItemSubType>

@end

@interface RACardType (RAItemSubType) <RAItemSubType>

@end

NS_ASSUME_NONNULL_END
