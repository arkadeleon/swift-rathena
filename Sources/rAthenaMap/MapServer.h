//
//  MapServer.h
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *MapServerGetName();

extern void MapServerSetOutput(FILE *output);

extern void MapServerMain();

NS_ASSUME_NONNULL_END
