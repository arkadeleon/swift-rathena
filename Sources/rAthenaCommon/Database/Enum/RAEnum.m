//
//  RAEnum.m
//  rAthena
//
//  Created by Leon Li on 2023/3/15.
//

#import "RAEnum.h"

@implementation RAEnum

+ (NSArray<RAEnum *> *)allCases {
    return @[];
}

+ (instancetype)caseOfName:(NSString *)name {
    for (RAEnum *kase in self.allCases) {
        if ([kase.name caseInsensitiveCompare:name] == NSOrderedSame) {
            return kase;
        }
    }
    return nil;
}

@end
