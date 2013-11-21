//
//  LCHFoursquareVenueBuilder.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCHNetworkManager.h"

@interface LCHFoursquareVenueBuilder : NSObject

- (NSArray*)buildVenuesFromJSON:(NSDictionary*)json;

@end
