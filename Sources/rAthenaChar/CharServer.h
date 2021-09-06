//
//  CharServer.h
//  rAthenaChar
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import "CharServerHandlers.h"

NS_ASSUME_NONNULL_BEGIN

#ifdef __cplusplus
extern "C" {
#endif

extern NSString *CharServerGetName();

extern void CharServerSetOutputHandler(CharServerOutputHandler handler);
extern void CharServerSetDataReceiveHandler(CharServerDataReceiveHandler handler);
extern void CharServerSetDataSendHandler(CharServerDataSendHandler handler);

extern void CharServerMain();

#ifdef __cplusplus
}
#endif

NS_ASSUME_NONNULL_END
