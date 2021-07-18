//
//  LoginServer.h
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

extern NSString *LoginServerGetName();

extern void LoginServerSetOutput(FILE *output);

extern void LoginServerMain();

#ifdef __cplusplus
}
#endif
