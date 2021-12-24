//
//  MapServerHandlers.h
//  rAthenaMap
//
//  Created by Leon Li on 2021/9/6.
//

#import <Foundation/Foundation.h>

typedef void (^MapServerOutputHandler)(NSData * _Nonnull buffer);
typedef void (^MapServerDataReceiveHandler)(NSData * _Nonnull data);
typedef void (^MapServerDataSendHandler)(NSData * _Nonnull data);

@interface MapServerHandlers : NSObject

@property (class, nonatomic, readonly) MapServerHandlers * _Nonnull sharedHandlers;

@property (nonatomic, copy) MapServerOutputHandler _Nullable outputHandler;
@property (nonatomic, copy) MapServerDataReceiveHandler _Nullable dataReceiveHandler;
@property (nonatomic, copy) MapServerDataSendHandler _Nullable dataSendHandler;

@end
