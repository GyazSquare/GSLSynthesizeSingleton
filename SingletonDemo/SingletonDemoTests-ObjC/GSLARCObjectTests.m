//
//  GSLARCObjectTests.m
//  SingletonDemo
//

@import Foundation;
@import XCTest;

#import "GSLARCObject.h"

@interface GSLARCObjectTests : XCTestCase
@end

@implementation GSLARCObjectTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSharedARCObject {
    GSLARCObject *sharedARCObject = [GSLARCObject sharedARCObject];
    // not nil
    XCTAssertNotNil(sharedARCObject);
    // shared
    XCTAssertEqualObjects(sharedARCObject, [GSLARCObject sharedARCObject]);
    // background
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSInteger count = 100;
    while (count-- > 0) {
        XCTestExpectation *expectation = [self expectationWithDescription:@"background"];
        dispatch_async(queue, ^{
            XCTAssertEqualObjects(sharedARCObject, [GSLARCObject sharedARCObject]);
            [expectation fulfill];
        });
    }
    [self waitForExpectationsWithTimeout:1 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"%@", error);
        }
    }];
}

- (void)testNew {
    XCTAssertNil([GSLARCObject new]);
}

- (void)testCopy {
    GSLARCObject *sharedARCObject = [GSLARCObject sharedARCObject];
    XCTAssertEqualObjects(sharedARCObject, [sharedARCObject copy]);
}

@end
