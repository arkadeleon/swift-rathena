//
//  RADatabaseParser.h
//  rAthena
//
//  Created by Leon Li on 2023/2/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RADatabaseParser;

@protocol RADatabaseParserDelegate <NSObject>

@optional
- (void)parser:(RADatabaseParser *)parser foundElement:(NSDictionary *)element;

@end

@interface RADatabaseParser : NSObject

@property (nonatomic, weak) id<RADatabaseParserDelegate> delegate;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithResource:(NSString *)name NS_DESIGNATED_INITIALIZER;

- (void)parse;

@end

NS_ASSUME_NONNULL_END
