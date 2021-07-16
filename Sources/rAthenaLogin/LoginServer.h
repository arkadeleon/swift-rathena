//
//  LoginServer.h
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *LoginServerGetName();

extern void LoginServerSetOutput(FILE *output);

extern void LoginServerMain();

NS_ASSUME_NONNULL_END
