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

MapServerDataReceiveHandler mapServerDataReceiveHandler = nil;
MapServerDataSendHandler mapServerDataSendHandler = nil;

void do_recv(int fd) {
    if (mapServerDataReceiveHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->rdata length:session[fd]->rdata_size];
        mapServerDataReceiveHandler(data);
    }
}

void do_send(int fd) {
    if (mapServerDataSendHandler) {
        NSData *data = [NSData dataWithBytes:session[fd]->wdata length:session[fd]->wdata_size];
        mapServerDataSendHandler(data);
    }
}

NSString *MapServerGetName() {
    return @"Map Server";
}

void MapServerSetOutput(FILE *output) {
    STDOUT = output;
    STDERR = output;
}

void MapServerSetDataReceiveHandler(MapServerDataReceiveHandler handler) {
    mapServerDataReceiveHandler = handler;
    recv_callback = do_recv;
}

void MapServerSetDataSendHandler(MapServerDataSendHandler handler) {
    mapServerDataSendHandler = handler;
    send_callback = do_send;
}

void MapServerMain() {
    char arg0[] = "Map-Server";
    char *args[1] = {arg0};
    main(1, args);
}
