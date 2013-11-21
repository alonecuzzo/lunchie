//
//  LCHFoursquareService.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LCHFoursquareService : NSObject

- (void)searchVenuesForLocation:(CLLocation*)location;

@end
