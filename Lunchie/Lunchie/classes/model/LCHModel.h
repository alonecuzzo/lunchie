//
//  LCHModel.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCHMenu;
@class LCHStoredVenue;

@interface LCHModel : NSObject

@property(nonatomic) NSArray *venues;
@property(nonatomic) LCHMenu *currentMenu;
@property(nonatomic) NSArray *storedVenues;
@property(nonatomic) NSArray *teamMembers;

- (LCHStoredVenue*)getStoredVenueForVenueID:(NSString*)venueID;
- (void)writeStoredVenue:(LCHStoredVenue*)storedVenue;
- (void)refreshStoredVenueData;
+ (id)sharedInstance;


@end
