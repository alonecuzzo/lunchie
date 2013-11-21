//
//  LCHFoursquareVenue.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHFoursquareVenue : NSObject

@property(nonatomic) NSString *venueID;
@property(nonatomic) NSString *venueName;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
