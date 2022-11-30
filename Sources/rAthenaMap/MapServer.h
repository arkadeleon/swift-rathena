//
//  MapServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

typedef void (^MapServerOutputHandler)(NSData * _Nonnull data);
typedef void (^MapServerDataReceiveHandler)(NSData * _Nonnull data);
typedef void (^MapServerDataSendHandler)(NSData * _Nonnull data);

@interface MapServer : NSThread

@property (nonatomic, copy) MapServerOutputHandler _Nullable outputHandler;
@property (nonatomic, copy) MapServerDataReceiveHandler _Nullable dataReceiveHandler;
@property (nonatomic, copy) MapServerDataSendHandler _Nullable dataSendHandler;

@end
