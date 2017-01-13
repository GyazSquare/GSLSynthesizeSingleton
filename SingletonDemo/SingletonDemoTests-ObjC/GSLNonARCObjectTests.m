//
//  GSLNonARCObjectTests.m
//  SingletonDemo
//

@import Foundation;
@import XCTest;

#import "GSLNonARCObject.h"

@interface GSLNonARCObjectTests : XCTestCase
@end

@implementation GSLNonARCObjectTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSharedNonARCObject {
    GSLNonARCObject *sharedNonARCObject = [GSLNonARCObject sharedNonARCObject];
    // not nil
    XCTAssertNotNil(sharedNonARCObject);
    // shared
    XCTAssertEqualObjects(sharedNonARCObject, [GSLNonARCObject sharedNonARCObject]);
    // background
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSInteger count = 100;
    while (count-- > 0) {
        XCTestExpectation *expectation = [self expectationWithDescription:@"background"];
        dispatch_async(queue, ^{
            XCTAssertEqualObjects(sharedNonARCObject, [GSLNonARCObject sharedNonARCObject]);
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
    XCTAssertNil([GSLNonARCObject new]);
}

- (void)testCopy {
    GSLNonARCObject *sharedNonARCObject = [GSLNonARCObject sharedNonARCObject];
    XCTAssertEqualObjects(sharedNonARCObject, [sharedNonARCObject copy]);
}

@end
