//
//  CharServer.h
//  rAthenaChar
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import "CharServerHandlers.h"

#ifdef __cplusplus
extern "C" {
#endif

extern NSString * _Nonnull CharServerGetName();

extern void CharServerSetOutputHandler(CharServerOutputHandler _Nullable handler);
extern void CharServerSetDataReceiveHandler(CharServerDataReceiveHandler _Nullable handler);
extern void CharServerSetDataSendHandler(CharServerDataSendHandler _Nullable handler);

extern void CharServerMain();

#ifdef __cplusplus
}
#endif
