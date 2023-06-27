//
//  RABitset.h
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RABitset : NSObject

@property (nonatomic, readonly) NSUInteger value;

+ (instancetype)bitsetWithValue:(NSUInteger)value;

- (BOOL)objectAtIndexedSubscript:(int)idx;
- (void)setObject:(BOOL)obj atIndexedSubscript:(int)idx;

@end

NS_ASSUME_NONNULL_END
