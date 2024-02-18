//
//  NSArray+Numbers.h
//  rAthena
//
//  Created by Leon Li on 2023/7/7.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

extern NSArray *NSArrayFromUInt8Array(uint8_t *array, size_t size);
extern NSArray *NSArrayFromInt8Array(int8_t *array, size_t size);

extern NSArray *NSArrayFromUInt16Array(uint16_t *array, size_t size);
extern NSArray *NSArrayFromInt16Array(int16_t *array, size_t size);

extern NSArray *NSArrayFromUInt32Array(uint32_t *array, size_t size);
extern NSArray *NSArrayFromInt32Array(int32_t *array, size_t size);

extern NSArray *NSArrayFromUInt64Array(uint64_t *array, size_t size);
extern NSArray *NSArrayFromInt64Array(int64_t *array, size_t size);

#ifdef __cplusplus
}
#endif