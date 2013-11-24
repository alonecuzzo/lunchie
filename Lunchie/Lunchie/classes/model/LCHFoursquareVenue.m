//
//  LCHFoursquareVenue.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHFoursquareVenue.h"

@implementation LCHFoursquareVenue

- (instancetype)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super self];
    if (self) {
        _venueID = [dictionary objectForKey:@"id"];
        _venueName = [dictionary objectForKey:@"name"];
        NSDictionary *location = [dictionary objectForKey:@"location"];
        _venueAddress = [location objectForKey:@"address"];
        NSDictionary *likes = [dictionary objectForKey:@"likes"];
        NSNumber *venueLikes = [likes objectForKey:@"count"];
        _venueLikes = [venueLikes intValue];
    }
    return self;
}

@end
