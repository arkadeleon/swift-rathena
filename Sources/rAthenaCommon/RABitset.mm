//
//  RABitset.m
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import "RABitset.h"
#include <bitset>

@interface RABitset ()

@property (nonatomic) std::bitset<64> bitset;

@end

@implementation RABitset

+ (instancetype)bitsetWithValue:(NSUInteger)value {
    RABitset *bitset = [[RABitset alloc] init];
    bitset.bitset = std::bitset<64>(value);
    return bitset;
}

- (NSUInteger)value {
    return self.bitset.to_ulong();
}

- (BOOL)objectAtIndexedSubscript:(int)idx {
    return self.bitset[idx];
}

- (void)setObject:(BOOL)obj atIndexedSubscript:(int)idx {
    self.bitset[idx] = obj;
}

@end
