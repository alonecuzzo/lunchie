//
//  LCHNetworkManager.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHNetworkManager.h"
#import "LCHFoursquareService.h"
#import "LCHModel.h"
#import "LCHFoursquareVenueBuilder.h"
#import <CoreLocation/CoreLocation.h>

@implementation LCHNetworkManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _foursquareService = [[LCHFoursquareService alloc] initWithDelegate:self];
        _foursquareVenueBuilder = [[LCHFoursquareVenueBuilder alloc] init];
    }
    return self;
}

- (void)searchVenuesForLocation:(CLLocation*)location
{
    [_foursquareService searchVenuesForLocation:location];
}

- (void)buildVenuesWithJSON:(NSDictionary *)json
{
    [[LCHModel sharedInstance] setVenues:[_foursquareVenueBuilder buildVenuesFromJSON:json]];
    [_delegate refreshVenues];
}

@end
