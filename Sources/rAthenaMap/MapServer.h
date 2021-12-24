//
//  MapServer.h
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import "MapServerHandlers.h"

#ifdef __cplusplus
extern "C" {
#endif

extern NSString * _Nonnull MapServerGetName();

extern void MapServerSetOutputHandler(MapServerOutputHandler _Nullable handler);
extern void MapServerSetDataReceiveHandler(MapServerDataReceiveHandler _Nullable handler);
extern void MapServerSetDataSendHandler(MapServerDataSendHandler _Nullable handler);

extern void MapServerMain();

#ifdef __cplusplus
}
#endif
