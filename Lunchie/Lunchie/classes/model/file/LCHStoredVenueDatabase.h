//
//  LCHStoredVenueDatabase.h
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHStoredVenueDatabase : NSObject

+ (NSMutableArray*)loadStoredVenueData;
+ (NSString*)nextStoredVenuePath;

@end
