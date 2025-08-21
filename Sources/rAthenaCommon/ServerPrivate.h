//
//  ServerPrivate.h
//  rAthena
//
//  Created by Leon Li on 2024/3/25.
//

#import "Server.h"

@interface Server ()

@property (nonatomic, readwrite) ServerStatus status;

@property (nonatomic) dispatch_queue_t startStopQueue;
@property (nonatomic) dispatch_queue_t outputQueue;

- (void)start;
- (void)stop;

@end
