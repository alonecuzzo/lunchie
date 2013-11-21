//
//  LCHFoursquareServiceTests.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LCHFoursquareService.h"

@interface LCHFoursquareServiceTests : XCTestCase

@property(nonatomic) LCHFoursquareService *service;

@end

@implementation LCHFoursquareServiceTests

- (void)setUp
{
    [super setUp];
    
    _service = [[LCHFoursquareService alloc] init];
}

- (void)tearDown
{
    _service = nil;
    
    [super tearDown];
}

#pragma mark - tests

- (void)testThatFousquareServiceIsInitialized
{
    XCTAssertNotNil(_service, @"service should exist");
}

@end
