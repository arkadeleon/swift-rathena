//
//  LoginServer.h
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import "LoginServerHandlers.h"

NS_ASSUME_NONNULL_BEGIN

#ifdef __cplusplus
extern "C" {
#endif

extern NSString *LoginServerGetName();

extern void LoginServerSetOutputHandler(LoginServerOutputHandler handler);
extern void LoginServerSetDataReceiveHandler(LoginServerDataReceiveHandler handler);
extern void LoginServerSetDataSendHandler(LoginServerDataSendHandler handler);

extern void LoginServerMain();

#ifdef __cplusplus
}
#endif

NS_ASSUME_NONNULL_END
