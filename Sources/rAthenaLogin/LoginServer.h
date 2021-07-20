//
//  LoginServer.h
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^LoginServerDataReceiveHandler)(NSData *data);
typedef void (^LoginServerDataSendHandler)(NSData *data);

#ifdef __cplusplus
extern "C" {
#endif

extern NSString *LoginServerGetName();

extern void LoginServerSetOutput(FILE *output);

extern void LoginServerSetDataReceiveHandler(LoginServerDataReceiveHandler handler);
extern void LoginServerSetDataSendHandler(LoginServerDataSendHandler handler);

extern void LoginServerMain();

#ifdef __cplusplus
}
#endif

NS_ASSUME_NONNULL_END
