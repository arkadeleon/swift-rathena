//
//  ServerMode.h
//  rAthena
//
//  Created by Leon Li on 2024/4/8.
//

#import <Foundation/Foundation.h>

typedef NS_CLOSED_ENUM(NSInteger, ServerMode) {
    ServerModePrerenewal,
    ServerModeRenewal
};

extern const ServerMode CurrentServerMode;
