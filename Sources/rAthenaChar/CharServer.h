//
//  CharServer.h
//  rAthenaChar
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CharServerDataReceiveHandler)(NSData *data);
typedef void (^CharServerDataSendHandler)(NSData *data);

#ifdef __cplusplus
extern "C" {
#endif

extern NSString *CharServerGetName();

extern void CharServerSetOutput(FILE *output);

extern void CharServerSetDataReceiveHandler(CharServerDataReceiveHandler handler);
extern void CharServerSetDataSendHandler(CharServerDataSendHandler handler);

extern void CharServerMain();

#ifdef __cplusplus
}
#endif

NS_ASSUME_NONNULL_END
