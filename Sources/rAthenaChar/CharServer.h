//
//  CharServer.h
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import <Foundation/Foundation.h>

typedef void (^CharServerOutputHandler)(NSData * _Nonnull data);
typedef void (^CharServerDataReceiveHandler)(NSData * _Nonnull data);
typedef void (^CharServerDataSendHandler)(NSData * _Nonnull data);

@interface CharServer : NSThread

@property (nonatomic, copy) CharServerOutputHandler _Nullable outputHandler;
@property (nonatomic, copy) CharServerDataReceiveHandler _Nullable dataReceiveHandler;
@property (nonatomic, copy) CharServerDataSendHandler _Nullable dataSendHandler;

@end
