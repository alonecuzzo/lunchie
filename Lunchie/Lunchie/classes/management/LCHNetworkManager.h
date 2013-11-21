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

@class LCHFoursquareService;
@class LCHFoursquareVenueBuilder;

@protocol LCHNetworkManagerProtocol <NSObject>

- (void)buildVenuesWithJSON:(NSDictionary*)json;

@end

@interface LCHNetworkManager : NSObject <LCHNetworkManagerProtocol>

- (instancetype)init;

@property(nonatomic) LCHFoursquareVenueBuilder *foursquareVenueBuilder;
@property(nonatomic) LCHFoursquareService *foursquareService;
@property(weak) id <LCHVenuesTableViewDelegate> delegate;

- (void)buildVenuesWithJSON:(NSDictionary *)json;
- (void)searchVenuesForLocation:(CLLocation*)location;

@end
