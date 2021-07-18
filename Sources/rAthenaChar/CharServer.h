//
//  CharServer.h
//  rAthenaChar
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

extern NSString *CharServerGetName();

extern void CharServerSetOutput(FILE *output);

extern void CharServerMain();

#ifdef __cplusplus
}
#endif
