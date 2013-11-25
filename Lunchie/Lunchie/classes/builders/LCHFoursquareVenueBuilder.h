//
//  LCHFoursquareVenueBuilder.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCHNetworkManager.h"

#define kIsThumbsDownFilterOn 1

@interface LCHFoursquareVenueBuilder : NSObject

- (NSArray*)buildVenuesFromJSON:(NSDictionary*)json;

@end
