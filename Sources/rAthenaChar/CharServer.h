//
//  CharServer.h
//  rAthenaChar
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *CharServerGetName();

extern void CharServerSetOutput(FILE *output);

extern void CharServerMain();

NS_ASSUME_NONNULL_END
