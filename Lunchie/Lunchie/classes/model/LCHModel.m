//
//  LCHModel.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHModel.h"
#import "LCHStoredVenue.h"
#import "LCHStoredVenueDatabase.h"

@implementation LCHModel

+ (id)sharedInstance
{
    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (LCHStoredVenue*)getStoredVenueForVenueID:(NSString*)venueID
{
    for (LCHStoredVenue *storedVenue in [[LCHModel sharedInstance] storedVenues]) {
        if ([storedVenue.data.venueID isEqualToString:venueID]) {
            return storedVenue;
        }
    }
    return nil;
}

- (void)refreshStoredVenueData
{
    [[LCHModel sharedInstance] setStoredVenues:[LCHStoredVenueDatabase loadStoredVenueData]];
}

- (void)writeStoredVenue:(LCHStoredVenue*)storedVenue
{
    NSLog(@"storing venue! %d", storedVenue.data.isThumbsDowned);
    [storedVenue saveData];
    [[LCHModel sharedInstance] refreshStoredVenueData];
}

@end
