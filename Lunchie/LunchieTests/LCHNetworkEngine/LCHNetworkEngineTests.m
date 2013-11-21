//
//  LCHNetworkEngineTests.m
//  Lunchie
//
//  Created by Jabari on 11/20/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LCHNetworkEngine.h"

@interface LCHNetworkEngineTests : XCTestCase

@end

@implementation LCHNetworkEngineTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testThatNetworkEngineCanBeCreated
{
    LCHNetworkEngine *networkEngine = [[LCHNetworkEngine alloc] initWithHostName:@""];
    XCTAssertNotNil(networkEngine, @"network engine should not be nil.");
}

- (void)testThatConsumerKeyIsExpectedConsumerKey
{
    NSString *consumerKey = @"7YchZpNqlC-csEdXC_auHQ";
    LCHNetworkEngine *networkEngine = [[LCHNetworkEngine alloc] initWithHostName:@""];
    XCTAssertTrue([[networkEngine consumerKey] isEqualToString:consumerKey], @"Network Engine should have correct yelp consumer key.");
}

- (void)testThatConsumerSecretIsExpectedConsumerSecret
{
    NSString *consumerSecret = @"HJrvg7SfITnMBQr8oKosHqvt6Fg";
    LCHNetworkEngine *networkEngine = [[LCHNetworkEngine alloc] initWithHostName:@""];
    XCTAssertTrue([[networkEngine consumerSecret] isEqualToString:consumerSecret], @"Network Engine should have correct yelp consumer secret.");
}

- (void)testThatTokenIsExpectedToken
{
    NSString *token = @"5d0vnt-TUgzDUsh0Di89fFkPugMrrUcM";
    LCHNetworkEngine *networkEngine = [[LCHNetworkEngine alloc] initWithHostName:@""];
    XCTAssertTrue([[networkEngine token] isEqualToString:token], @"Network Engine should have correct yelp token.");
}

- (void)testThatTokenSecretIsExpectedTokenSecret
{
    NSString *tokenSecret = @"N_TrhHbo2OOHXQ7f45mW55XFZGU";
    LCHNetworkEngine *networkEngine = [[LCHNetworkEngine alloc] initWithHostName:@""];
    XCTAssertTrue([[networkEngine tokenSecret] isEqualToString:tokenSecret], @"Network Engine should have correct yelp token.");
}


@end
