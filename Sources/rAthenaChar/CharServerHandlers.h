//
//  CharServerHandlers.h
//  rAthenaChar
//
//  Created by Leon Li on 2021/9/6.
//

#import <Foundation/Foundation.h>

typedef void (^CharServerOutputHandler)(NSData * _Nonnull buffer);
typedef void (^CharServerDataReceiveHandler)(NSData * _Nonnull data);
typedef void (^CharServerDataSendHandler)(NSData * _Nonnull data);

@interface CharServerHandlers : NSObject

@property (class, nonatomic, readonly) CharServerHandlers * _Nonnull sharedHandlers;

@property (nonatomic, copy) CharServerOutputHandler _Nullable outputHandler;
@property (nonatomic, copy) CharServerDataReceiveHandler _Nullable dataReceiveHandler;
@property (nonatomic, copy) CharServerDataSendHandler _Nullable dataSendHandler;

@end
