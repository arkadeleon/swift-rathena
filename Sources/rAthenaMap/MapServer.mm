//
//  MapServer.m
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import "MapServer.h"
#include "showmsg.hpp"
#include "socket.hpp"

extern int main (int argc, char **argv);

int write_function(void *cookie, const char *buf, int n) {
    MapServerOutputHandler handler = MapServerHandlers.sharedHandlers.outputHandler;
    if (handler) {
        NSData *data = [NSData dataWithBytes:buf length:n];
        handler(data);
    }
    return 0;
}

void do_recv(int fd) {
    MapServerDataReceiveHandler handler = MapServerHandlers.sharedHandlers.dataReceiveHandler;
    if (handler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        handler(data);
    }
}

void do_send(int fd) {
    MapServerDataSendHandler handler = MapServerHandlers.sharedHandlers.dataSendHandler;
    if (handler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        handler(data);
    }
}

NSString *MapServerGetName() {
    return @"Map Server";
}

void MapServerSetOutputHandler(MapServerOutputHandler handler) {
    MapServerHandlers.sharedHandlers.outputHandler = handler;

    static FILE *output = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        output = fwopen(0, write_function);
        STDOUT = output;
        STDERR = output;
    });
}

void MapServerSetDataReceiveHandler(MapServerDataReceiveHandler handler) {
    MapServerHandlers.sharedHandlers.dataReceiveHandler = handler;
    recv_callback = do_recv;
}

void MapServerSetDataSendHandler(MapServerDataSendHandler handler) {
    MapServerHandlers.sharedHandlers.dataSendHandler = handler;
    send_callback = do_send;
}

void MapServerMain() {
    char arg0[] = "Map-Server";
    char *args[1] = {arg0};
    main(1, args);
}
