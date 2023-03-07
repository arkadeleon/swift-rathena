//
//  RADatabaseDecoder.h
//  rAthena
//
//  Created by Leon Li on 2023/2/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RADatabaseDecoder : NSObject

- (NSArray *)decodeArrayOfObjectsOfClass:(Class)cls fromResource:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
