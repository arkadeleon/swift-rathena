//
//  Mode.h
//  rAthena
//
//  Created by Leon Li on 2024/4/8.
//

#import <Foundation/Foundation.h>

typedef NS_CLOSED_ENUM(NSInteger, Mode) {
    ModePrerenewal,
    ModeRenewal
};

extern const Mode CurrentMode;
