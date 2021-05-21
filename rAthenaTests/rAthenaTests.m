//
//  rAthenaTests.m
//  rAthenaTests
//
//  Created by Leon Li on 2021/5/19.
//

#import <XCTest/XCTest.h>

@import rAthena;

@interface rAthenaTests : XCTestCase

@end

@implementation rAthenaTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    const char *cwd = [[[NSBundle bundleForClass:[RAServerManager class]] bundlePath] UTF8String];
    chdir(cwd);

    [[[RAServerManager sharedManager] loginServer] start];

    [self waitForExpectationsWithTimeout:MAXFLOAT handler:nil];
}

@end
