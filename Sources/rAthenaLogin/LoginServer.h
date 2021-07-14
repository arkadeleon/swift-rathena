//
//  LoginServer.h
//  rAthenaLogin
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginServer : NSObject

@property (nonatomic, readonly, copy) NSString *name;

@property (nonatomic, assign) FILE *output;

- (BOOL)start;
- (BOOL)stop;

- (void)send:(NSString *)input;

@end

NS_ASSUME_NONNULL_END
