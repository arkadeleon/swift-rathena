//
//  RACharServer.h
//  rAthenaChar
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RACharServer : NSThread

@property (nonatomic, assign) FILE *output;

@end

NS_ASSUME_NONNULL_END
