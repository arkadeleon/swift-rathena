//
//  MapServer.h
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

extern NSString *MapServerGetName();

extern void MapServerSetOutput(FILE *output);

extern void MapServerMain();

#ifdef __cplusplus
}
#endif
