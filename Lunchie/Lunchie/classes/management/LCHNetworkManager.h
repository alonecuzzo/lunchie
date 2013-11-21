//
//  LCHNetworkManager.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "LCHViewController.h"
#import "LCHFoursquareVenueMenuBuilder.h"

@class LCHFoursquareService;
@class LCHFoursquareVenueBuilder;

@protocol LCHNetworkManagerProtocol <NSObject>

- (void)buildVenuesWithJSON:(NSDictionary*)json;

@optional
- (void)buildMenuWithJSON:(NSDictionary*)json;

@end

@interface LCHNetworkManager : NSObject <LCHNetworkManagerProtocol>

- (instancetype)init;

@property(nonatomic) LCHFoursquareVenueBuilder *foursquareVenueBuilder;
@property(nonatomic) LCHFoursquareVenueMenuBuilder *foursquareVenueMenuBuilder;
@property(nonatomic) LCHFoursquareService *foursquareService;
@property(weak) id <LCHVenuesTableViewDelegate> delegate;

- (void)buildVenuesWithJSON:(NSDictionary *)json;
- (void)searchVenuesForLocation:(CLLocation*)location;
- (void)searcMenusForVenueID:(NSString*)venueID;

@end
