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
    }
    return self;
}

@end
