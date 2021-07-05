//
//  MapServer.h
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapServer : NSThread

@property (nonatomic, assign) FILE *output;

- (void)send:(NSString *)input;

@end

NS_ASSUME_NONNULL_END
