//
//  LCHFoursquareVenueMenuBuilder.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHFoursquareVenueMenuBuilder : NSObject

- (void)buildMenuFromJSON:(NSDictionary*)json;

@end