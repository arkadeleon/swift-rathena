//
//  ServerManager.m
//  rAthena
//
//  Created by Leon Li on 2021/5/19.
//

#import "ServerManager.h"
#import "TerminalView.h"
#import <sqlite3.h>
#import <rAthenaChar/rAthenaChar.h>
#import <rAthenaLogin/rAthenaLogin.h>
#import <rAthenaMap/rAthenaMap.h>

@interface ServerManager ()

@property (nonatomic, readonly, strong) NSThread *charServer;
@property (nonatomic, readonly, strong) NSThread *loginServer;
@property (nonatomic, readonly, strong) NSThread *mapServer;

@property (nonatomic, readonly, strong) TerminalView *charTerminalView;
@property (nonatomic, readonly, strong) TerminalView *loginTerminalView;
@property (nonatomic, readonly, strong) TerminalView *mapTerminalView;

@end

@implementation ServerManager

+ (ServerManager *)sharedManager {
    static ServerManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[ServerManager alloc] init];
    });
    return sharedManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _charServer = [[NSThread alloc] initWithBlock:^{
            CharServerMain();
        }];
        _charTerminalView = [[TerminalView alloc] init];
        CharServerSetOutput(_charTerminalView.terminal.output);

        _loginServer = [[NSThread alloc] initWithBlock:^{
            LoginServerMain();
        }];
        _loginTerminalView = [[TerminalView alloc] init];
        LoginServerSetOutput(_loginTerminalView.terminal.output);

        _mapServer = [[NSThread alloc] initWithBlock:^{
            MapServerMain();
        }];
        _mapTerminalView = [[TerminalView alloc] init];
        MapServerSetOutput(_mapTerminalView.terminal.output);
    }
    return self;
}

- (NSString *)nameForServer:(ServerMask)server {
    if ((server & ServerMaskChar) != 0) {
        return CharServerGetName();
    } else if ((server & ServerMaskLogin) != 0) {
        return LoginServerGetName();
    } else if ((server & ServerMaskMap) != 0) {
        return MapServerGetName();
    } else {
        return nil;
    }
}

- (UIView *)terminalViewForServer:(ServerMask)server {
    if ((server & ServerMaskChar) != 0) {
        return self.charTerminalView;
    } else if ((server & ServerMaskLogin) != 0) {
        return self.loginTerminalView;
    } else if ((server & ServerMaskMap) != 0) {
        return self.mapTerminalView;
    } else {
        return nil;
    }
}

- (void)startServers:(ServerMask)servers {
    if ((servers & ServerMaskChar) != 0) {
        if (!self.charServer.isExecuting) {
            [self.charServer start];
        }
    }
    if ((servers & ServerMaskLogin) != 0) {
        if (!self.loginServer.isExecuting) {
            [self.loginServer start];
        }
    }
    if ((servers & ServerMaskMap) != 0) {
        if (!self.mapServer.isExecuting) {
            [self.mapServer start];
        }
    }
}

- (void)clearTerminalForServers:(ServerMask)servers {
    if ((servers & ServerMaskChar) != 0) {
        [self.charTerminalView.terminal clear];
    }
    if ((servers & ServerMaskLogin) != 0) {
        [self.loginTerminalView.terminal clear];
    }
    if ((servers & ServerMaskMap) != 0) {
        [self.mapTerminalView.terminal clear];
    }
}

- (void)copyBundleResourcesAndChangeDirectory {
    NSURL *src = [[NSBundle bundleForClass:[ServerManager class]] bundleURL];
    NSURL *dst = [[[NSFileManager defaultManager] URLForDirectory:NSLibraryDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil] URLByAppendingPathComponent:@"rathena"];

    [[NSFileManager defaultManager] createDirectoryAtURL:dst withIntermediateDirectories:YES attributes:nil error:nil];

    NSURL *srcDB = [src URLByAppendingPathComponent:@"ragnarok.sqlite3"];
    NSURL *dstDB = [dst URLByAppendingPathComponent:@"ragnarok.sqlite3"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dstDB.path]) {
        [[NSFileManager defaultManager] copyItemAtURL:srcDB toURL:dstDB error:nil];
    }

    NSArray<NSString *> *paths = @[@"conf", @"db", @"npc"];
    for (NSString *path in paths) {
        NSURL *srcURL = [src URLByAppendingPathComponent:path];
        NSURL *dstURL = [dst URLByAppendingPathComponent:path];
        [[NSFileManager defaultManager] removeItemAtURL:dstURL error:nil];
        [[NSFileManager defaultManager] copyItemAtURL:srcURL toURL:dstURL error:nil];
    }

    [[NSFileManager defaultManager] moveItemAtURL:[dst URLByAppendingPathComponent:@"conf/import-tmpl"] toURL:[dst URLByAppendingPathComponent:@"conf/import"] error:nil];

    [[NSFileManager defaultManager] changeCurrentDirectoryPath:dst.path];

    [self upgradeDatabaseAtURL:dstDB];
}

- (void)upgradeDatabaseAtURL:(NSURL *)url {
    sqlite3 *db = nil;
    sqlite3_open(url.path.UTF8String, &db);

    NSURL *upgradeFilesDirectory = [[[NSBundle bundleForClass:[ServerManager class]] bundleURL] URLByAppendingPathComponent:@"sql-files/upgrades"];
    NSArray<NSURL *> *upgradeFiles = [[[NSFileManager defaultManager] contentsOfDirectoryAtURL:upgradeFilesDirectory includingPropertiesForKeys:nil options:0 error:nil] sortedArrayUsingComparator:^NSComparisonResult(NSURL *url1, NSURL *url2) {
        return [url1.path compare:url2.path];
    }];

    for (NSURL *upgradeFile in upgradeFiles) {
        NSString *upgradeID = upgradeFile.lastPathComponent.stringByDeletingPathExtension;

        if (![upgradeID hasPrefix:@"upgrade_"]) {
            continue;
        }

        NSString *sql = [NSString stringWithFormat:@"SELECT count(*) FROM upgrades WHERE id = '%@' LIMIT 1", upgradeID];
        sqlite3_stmt *stmt = nil;
        sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, nil);
        sqlite3_step(stmt);
        int count = sqlite3_column_int(stmt, 0);
        sqlite3_finalize(stmt);
        stmt = nil;

        if (count == 1) {
            continue;
        }

        sql = [[NSString alloc] initWithContentsOfURL:upgradeFile encoding:NSUTF8StringEncoding error:nil];
        sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, nil);
        sqlite3_step(stmt);
        sqlite3_finalize(stmt);
        stmt = nil;

        sql = [NSString stringWithFormat:@"INSERT INTO upgrades VALUES ('%@')", upgradeID];
        sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, nil);
        sqlite3_step(stmt);
        sqlite3_finalize(stmt);
        stmt = nil;
    }

    sqlite3_close(db);
}

@end
