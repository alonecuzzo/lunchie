//
//  LCHFoursquareService.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "LCHNetworkManager.h"

@interface LCHFoursquareService : NSObject

@property(weak) id <LCHNetworkManagerProtocol> delegate;

- (instancetype)initWithDelegate:(id<LCHNetworkManagerProtocol>)delegate;
- (void)searchVenuesForLocation:(CLLocation*)location;
- (void)searchMenuForVenueID:(NSString*)venueID;

@end
