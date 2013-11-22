//
//  LCHStoredVenueData.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHStoredVenueData : NSObject <NSCoding>

@property(nonatomic) NSString *venueID;
@property(nonatomic) NSArray *comments;
@property(assign) BOOL hasBeenVisited;
@property(assign) BOOL isLiked;

- (instancetype)initWithDictionary:(NSDictionary*)dict;

@end
