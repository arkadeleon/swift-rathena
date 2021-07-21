//
//  MapServer.h
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^MapServerDataReceiveHandler)(NSData *data);
typedef void (^MapServerDataSendHandler)(NSData *data);

#ifdef __cplusplus
extern "C" {
#endif

extern NSString *MapServerGetName();

extern void MapServerSetOutput(FILE *output);

extern void MapServerSetDataReceiveHandler(MapServerDataReceiveHandler handler);
extern void MapServerSetDataSendHandler(MapServerDataSendHandler handler);

extern void MapServerMain();

#ifdef __cplusplus
}
#endif

NS_ASSUME_NONNULL_END
