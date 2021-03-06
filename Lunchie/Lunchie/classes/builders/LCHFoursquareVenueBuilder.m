//
//  LCHFoursquareVenueBuilder.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHFoursquareVenueBuilder.h"
#import "LCHFoursquareVenue.h"
#import "LCHModel.h"

@implementation LCHFoursquareVenueBuilder

- (NSArray*)buildVenuesFromJSON:(NSDictionary*)json
{
    NSDictionary *responseJSON = [json objectForKey:@"response"];
    NSArray *venuesArray = [responseJSON objectForKey:@"venues"];
    NSMutableArray *venuesToReturn = [NSMutableArray array];
    LCHFoursquareVenue *venue;
    for (NSDictionary *dict in venuesArray) {
        venue = [[LCHFoursquareVenue alloc] initWithDictionary:dict];
        if ([[LCHModel sharedInstance] getStoredVenueForVenueID:venue.venueID]) {
            venue.storedVenue = [[LCHModel sharedInstance] getStoredVenueForVenueID:venue.venueID];
            if (venue.storedVenue.data.isThumbsDowned && kIsThumbsDownFilterOn == 1) {
                continue;
            }
        }
        [venuesToReturn addObject:venue];
    }
    return (NSArray*)venuesToReturn;
}

@end
