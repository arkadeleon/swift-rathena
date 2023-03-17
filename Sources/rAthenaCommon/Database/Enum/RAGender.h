//
//  RAGender.h
//  rAthena
//
//  Created by Leon Li on 2023/3/17.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RAGender : RAEnum

@property (nonatomic, class, readonly) RAGender *female;
@property (nonatomic, class, readonly) RAGender *male;
@property (nonatomic, class, readonly) RAGender *both;

@property (nonatomic, class, readonly) NSArray<RAGender *> *allCases;

@end

NS_ASSUME_NONNULL_END
