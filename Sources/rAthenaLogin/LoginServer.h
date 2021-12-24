//
//  LoginServer.h
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import "LoginServerHandlers.h"

#ifdef __cplusplus
extern "C" {
#endif

extern NSString * _Nonnull LoginServerGetName();

extern void LoginServerSetOutputHandler(LoginServerOutputHandler _Nullable handler);
extern void LoginServerSetDataReceiveHandler(LoginServerDataReceiveHandler _Nullable handler);
extern void LoginServerSetDataSendHandler(LoginServerDataSendHandler _Nullable handler);

extern void LoginServerMain();

#ifdef __cplusplus
}
#endif
