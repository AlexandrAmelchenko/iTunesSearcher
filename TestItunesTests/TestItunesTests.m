//
//  TestItunesTests.m
//  TestItunesTests
//
//  Created by Alex Amelchenko on 04/06/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RestKit.h"
#import "API.h"
#import "SearchEntity.h"
#import "ViewModel.h"

@interface TestItunesTests : XCTestCase

@property SearchEntity *testEnt;

@end

@implementation TestItunesTests

- (void)setUp {
    [super setUp];
    _testEnt = [[SearchEntity alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testViewModel {
    ViewModel *testModel = [ViewModel new];
    XCTAssertEqual(0, testModel.numberOfItems);
    testModel.model = [TestModel new];
    XCTAssertEqual(0, testModel.numberOfItems);
    testModel.model.results = @[];
    XCTAssertEqual(0, testModel.numberOfItems);
     testModel.model.results = @[[SearchEntity new]];
    XCTAssertEqual(1, testModel.numberOfItems);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
