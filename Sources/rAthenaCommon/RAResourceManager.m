//
//  RAResourceManager.m
//  rAthena
//
//  Created by Leon Li on 2023/2/16.
//

#import "RAResourceManager.h"

@import SQLite3;

@implementation RAResourceManager

+ (RAResourceManager *)sharedManager {
    static RAResourceManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[RAResourceManager alloc] init];
    });
    return sharedManager;
}

- (NSString *)pathForResource:(NSString *)name {
    return [SWIFTPM_MODULE_BUNDLE.resourcePath stringByAppendingPathComponent:name];
}

- (NSData *)dataForResource:(NSString *)name {
    NSURL *url = [SWIFTPM_MODULE_BUNDLE.resourceURL URLByAppendingPathComponent:name];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return data;
}

- (void)copyResourcesToLibraryDirectory {
    NSURL *srcDir = SWIFTPM_MODULE_BUNDLE.resourceURL;
    NSURL *dstDir = [NSFileManager.defaultManager URLForDirectory:NSLibraryDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];

    [NSFileManager.defaultManager createDirectoryAtURL:dstDir withIntermediateDirectories:YES attributes:nil error:nil];
    [NSFileManager.defaultManager changeCurrentDirectoryPath:dstDir.path];

    [self copyResource:@"ragnarok.sqlite3" atDirectory:srcDir toDirectory:dstDir replaceIfExists:NO];
    [self copyResource:@"conf" atDirectory:srcDir toDirectory:dstDir replaceIfExists:YES];
    [self copyResource:@"db" atDirectory:srcDir toDirectory:dstDir replaceIfExists:YES];
    [self copyResource:@"npc" atDirectory:srcDir toDirectory:dstDir replaceIfExists:YES];

    [NSFileManager.defaultManager moveItemAtURL:[dstDir URLByAppendingPathComponent:@"conf/import-tmpl"] toURL:[dstDir URLByAppendingPathComponent:@"conf/import"] error:nil];

    [self upgradeDatabaseAtURL:[dstDir URLByAppendingPathComponent:@"ragnarok.sqlite3"]];
}

- (void)copyResource:(NSString *)name atDirectory:(NSURL *)srcDir toDirectory:(NSURL *)dstDir replaceIfExists:(BOOL)replaceIfExists {
    NSURL *srcURL = [srcDir URLByAppendingPathComponent:name];
    NSURL *dstURL = [dstDir URLByAppendingPathComponent:name];

    if (replaceIfExists && [NSFileManager.defaultManager fileExistsAtPath:dstURL.path]) {
        [NSFileManager.defaultManager removeItemAtURL:dstURL error:nil];
    }

    if (![NSFileManager.defaultManager fileExistsAtPath:dstURL.path]) {
        [NSFileManager.defaultManager copyItemAtURL:srcURL toURL:dstURL error:nil];
    }
}

- (void)upgradeDatabaseAtURL:(NSURL *)url {
    sqlite3 *db = nil;
    if (sqlite3_open(url.path.UTF8String, &db) != SQLITE_OK) {
        return;
    }

    NSString *sql = @"CREATE TABLE IF NOT EXISTS `upgrades` (`id` TEXT NOT NULL, PRIMARY KEY (id));";
    sqlite3_stmt *stmt = nil;
    if (sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL) == SQLITE_OK) {
        sqlite3_step(stmt);
        sqlite3_finalize(stmt);
        stmt = nil;
    }

    NSDictionary<NSString *, NSString *> *upgrades = @{
        @"20230224": @"ALTER TABLE `char` ADD COLUMN `last_instanceid` INTEGER NOT NULL DEFAULT '0';",
    };

    NSArray<NSString *> *upgradeIDs = upgrades.allKeys;
    for (NSString *upgradeID in upgradeIDs) {
        sql = [NSString stringWithFormat:@"SELECT count(*) FROM upgrades WHERE id = '%@' LIMIT 1", upgradeID];
        if (sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL) == SQLITE_OK) {
            sqlite3_step(stmt);
            int count = sqlite3_column_int(stmt, 0);
            sqlite3_finalize(stmt);
            stmt = nil;
            if (count == 1) {
                continue;
            }
        }

        sql = upgrades[upgradeID];
        if (sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL) == SQLITE_OK) {
            sqlite3_step(stmt);
            sqlite3_finalize(stmt);
            stmt = nil;
        }

        sql = [NSString stringWithFormat:@"INSERT INTO upgrades VALUES ('%@')", upgradeID];
        if (sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL) == SQLITE_OK) {
            sqlite3_step(stmt);
            sqlite3_finalize(stmt);
            stmt = nil;
        }
    }

    sqlite3_close(db);
}

@end
