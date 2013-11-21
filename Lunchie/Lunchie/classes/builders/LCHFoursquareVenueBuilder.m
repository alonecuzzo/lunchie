//
//  LCHFoursquareVenueBuilder.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHFoursquareVenueBuilder.h"
#import "LCHFoursquareVenue.h"

@implementation LCHFoursquareVenueBuilder

- (NSArray*)buildVenuesFromJSON:(NSDictionary*)json
{
    NSDictionary *responseJSON = [json objectForKey:@"response"];
    NSArray *venuesArray = [responseJSON objectForKey:@"venues"];
    NSMutableArray *venuesToReturn = [NSMutableArray array];
    LCHFoursquareVenue *venue;
    for (NSDictionary *dict in venuesArray) {
        venue = [[LCHFoursquareVenue alloc] initWithDictionary:dict];
        [venuesToReturn addObject:venue];
        NSLog(@"name: %@", venue.venueName);
        NSLog(@"id: %@", venue.venueID);
    }
    return (NSArray*)venuesToReturn;
}

@end
