//
//  RAServerManager.m
//  rAthenaMap
//
//  Created by Leon Li on 2021/5/19.
//

#import "RAServerManager.h"
#import "TerminalView.h"
#import <sqlite3.h>

@import rAthenaChar;
@import rAthenaLogin;
@import rAthenaMap;

@interface RAServerManager ()

@property (nonatomic, readonly, strong) RACharServer *charServer;
@property (nonatomic, readonly, strong) RALoginServer *loginServer;
@property (nonatomic, readonly, strong) RAMapServer *mapServer;

@property (nonatomic, readonly, strong) TerminalView *charTerminalView;
@property (nonatomic, readonly, strong) TerminalView *loginTerminalView;
@property (nonatomic, readonly, strong) TerminalView *mapTerminalView;

@end

@implementation RAServerManager

+ (RAServerManager *)sharedManager {
    static RAServerManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[RAServerManager alloc] init];
    });
    return sharedManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _charServer = [[RACharServer alloc] init];
        _charTerminalView = [[TerminalView alloc] init];
        _charServer.output = _charTerminalView.terminal.output;

        _loginServer = [[RALoginServer alloc] init];
        _loginTerminalView = [[TerminalView alloc] init];
        _loginServer.output = _loginTerminalView.terminal.output;

        _mapServer = [[RAMapServer alloc] init];
        _mapTerminalView = [[TerminalView alloc] init];
        _mapServer.output = _mapTerminalView.terminal.output;
    }
    return self;
}

- (NSString *)nameForServer:(RAServerMask)server {
    if ((server & RAServerMaskChar) != 0) {
        return self.charServer.name;
    } else if ((server & RAServerMaskLogin) != 0) {
        return self.loginServer.name;
    } else if ((server & RAServerMaskMap) != 0) {
        return self.mapServer.name;
    } else {
        return nil;
    }
}

- (UIView *)terminalViewForServer:(RAServerMask)server {
    if ((server & RAServerMaskChar) != 0) {
        return self.charTerminalView;
    } else if ((server & RAServerMaskLogin) != 0) {
        return self.loginTerminalView;
    } else if ((server & RAServerMaskMap) != 0) {
        return self.mapTerminalView;
    } else {
        return nil;
    }
}

- (void)startServers:(RAServerMask)servers {
    if ((servers & RAServerMaskChar) != 0) {
        if (!self.charServer.isExecuting) {
            [self.charServer start];
        }
    }
    if ((servers & RAServerMaskLogin) != 0) {
        if (!self.loginServer.isExecuting) {
            [self.loginServer start];
        }
    }
    if ((servers & RAServerMaskMap) != 0) {
        if (!self.mapServer.isExecuting) {
            [self.mapServer start];
        }
    }
}

- (void)send:(NSString *)input toServers:(RAServerMask)servers {
    if ((servers & RAServerMaskChar) != 0) {
        [self.charServer send:input];
    }
    if ((servers & RAServerMaskLogin) != 0) {
        [self.loginServer send:input];
    }
    if ((servers & RAServerMaskMap) != 0) {
        [self.mapServer send:input];
    }
}

- (void)clearTerminalForServers:(RAServerMask)servers {
    if ((servers & RAServerMaskChar) != 0) {
        [self.charTerminalView.terminal clear];
    }
    if ((servers & RAServerMaskLogin) != 0) {
        [self.loginTerminalView.terminal clear];
    }
    if ((servers & RAServerMaskMap) != 0) {
        [self.mapTerminalView.terminal clear];
    }
}

- (void)copyBundleResourcesAndChangeDirectory {
    NSURL *src = [[NSBundle bundleForClass:[RAServerManager class]] bundleURL];
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

    NSURL *upgradeFilesDirectory = [[[NSBundle bundleForClass:[RAServerManager class]] bundleURL] URLByAppendingPathComponent:@"sql-files/upgrades"];
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
