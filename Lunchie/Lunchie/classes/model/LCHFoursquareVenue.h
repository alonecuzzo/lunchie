//
//  LCHFoursquareVenue.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCHStoredVenue.h"

@interface LCHFoursquareVenue : NSObject

@property(nonatomic) NSString *venueID;
@property(nonatomic) NSString *venueName;
@property(nonatomic) NSString *venueAddress;
@property(nonatomic) LCHStoredVenue *storedVenue;
@property(assign) uint venueLikes;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
