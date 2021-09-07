//
//  MapServerHandlers.h
//  rAthenaMap
//
//  Created by Leon Li on 2021/9/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^MapServerOutputHandler)(NSData *buffer);
typedef void (^MapServerDataReceiveHandler)(NSData *data);
typedef void (^MapServerDataSendHandler)(NSData *data);

@interface MapServerHandlers : NSObject

@property (class, nonatomic, readonly) MapServerHandlers *sharedHandlers;

@property (nonatomic, copy) MapServerOutputHandler outputHandler;
@property (nonatomic, copy) MapServerDataReceiveHandler dataReceiveHandler;
@property (nonatomic, copy) MapServerDataSendHandler dataSendHandler;

@end

NS_ASSUME_NONNULL_END
