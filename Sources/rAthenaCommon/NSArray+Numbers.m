//
//  NSArray+Numbers.m
//  rAthena
//
//  Created by Leon Li on 2023/7/7.
//

#import "NSArray+Numbers.h"

NSArray *NSArrayFromUInt8Array(uint8_t *array, size_t size) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:size];
    for (int index = 0; index < size; index++) {
        [numbers addObject:@(array[index])];
    }
    return [numbers copy];
}

NSArray *NSArrayFromInt8Array(int8_t *array, size_t size) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:size];
    for (int index = 0; index < size; index++) {
        [numbers addObject:@(array[index])];
    }
    return [numbers copy];
}

NSArray *NSArrayFromUInt16Array(uint16_t *array, size_t size) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:size];
    for (int index = 0; index < size; index++) {
        [numbers addObject:@(array[index])];
    }
    return [numbers copy];
}

NSArray *NSArrayFromInt16Array(int16_t *array, size_t size) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:size];
    for (int index = 0; index < size; index++) {
        [numbers addObject:@(array[index])];
    }
    return [numbers copy];
}

NSArray *NSArrayFromUInt32Array(uint32_t *array, size_t size) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:size];
    for (int index = 0; index < size; index++) {
        [numbers addObject:@(array[index])];
    }
    return [numbers copy];
}

NSArray *NSArrayFromInt32Array(int32_t *array, size_t size) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:size];
    for (int index = 0; index < size; index++) {
        [numbers addObject:@(array[index])];
    }
    return [numbers copy];
}

NSArray *NSArrayFromUInt64Array(uint64_t *array, size_t size) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:size];
    for (int index = 0; index < size; index++) {
        [numbers addObject:@(array[index])];
    }
    return [numbers copy];
}

NSArray *NSArrayFromInt64Array(int64_t *array, size_t size) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:size];
    for (int index = 0; index < size; index++) {
        [numbers addObject:@(array[index])];
    }
    return [numbers copy];
}
