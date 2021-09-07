//
//  CharServerHandlers.h
//  rAthenaChar
//
//  Created by Leon Li on 2021/9/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CharServerOutputHandler)(NSData *buffer);
typedef void (^CharServerDataReceiveHandler)(NSData *data);
typedef void (^CharServerDataSendHandler)(NSData *data);

@interface CharServerHandlers : NSObject

@property (class, nonatomic, readonly) CharServerHandlers *sharedHandlers;

@property (nonatomic, copy) CharServerOutputHandler outputHandler;
@property (nonatomic, copy) CharServerDataReceiveHandler dataReceiveHandler;
@property (nonatomic, copy) CharServerDataSendHandler dataSendHandler;

@end

NS_ASSUME_NONNULL_END
