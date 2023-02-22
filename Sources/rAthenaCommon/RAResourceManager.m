//
//  RAResourceManager.m
//  rAthena
//
//  Created by Leon Li on 2023/2/16.
//

#import "RAResourceManager.h"

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

@end
