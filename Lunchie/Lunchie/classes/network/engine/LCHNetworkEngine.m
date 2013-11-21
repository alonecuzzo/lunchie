//
//  LCHNetworkEngine.m
//  Lunchie
//
//  Created by Jabari on 11/20/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHNetworkEngine.h"

static NSString *YELP_CONSUMER_KEY = @"7YchZpNqlC-csEdXC_auHQ";
static NSString *YELP_CONSUMER_SECRET = @"HJrvg7SfITnMBQr8oKosHqvt6Fg";
static NSString *YELP_TOKEN = @"5d0vnt-TUgzDUsh0Di89fFkPugMrrUcM";
static NSString *YELP_TOKEN_SECRET = @"N_TrhHbo2OOHXQ7f45mW55XFZGU";

@implementation LCHNetworkEngine

- (NSString*)consumerKey
{
    return YELP_CONSUMER_KEY;
}

- (NSString*)consumerSecret
{
    return YELP_CONSUMER_SECRET;
}

- (NSString*)token
{
    return YELP_TOKEN;
}

- (NSString*)tokenSecret
{
    return YELP_TOKEN_SECRET;
}

@end
