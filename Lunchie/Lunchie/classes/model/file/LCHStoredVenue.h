//
//  LCHStoredVenue.h
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCHStoredVenueData.h"

@interface LCHStoredVenue : NSObject

@property(nonatomic) LCHStoredVenueData *data;
@property(nonatomic) NSString *docPath;

- (void)saveData;
- (instancetype)initWithDictionary:(NSDictionary*)dict;
- (instancetype)initWithDocPath:(NSString*)docPath;

@end
