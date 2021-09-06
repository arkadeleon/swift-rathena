//
//  MapServer.h
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import "MapServerHandlers.h"

NS_ASSUME_NONNULL_BEGIN

#ifdef __cplusplus
extern "C" {
#endif

extern NSString *MapServerGetName();

extern void MapServerSetOutputHandler(MapServerOutputHandler handler);
extern void MapServerSetDataReceiveHandler(MapServerDataReceiveHandler handler);
extern void MapServerSetDataSendHandler(MapServerDataSendHandler handler);

extern void MapServerMain();

#ifdef __cplusplus
}
#endif

NS_ASSUME_NONNULL_END
