//
//  LCHStoredVenueData.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kVenueIDKey @"venueID"
#define kCommentsKey @"comments"
#define kHasBeenVisitedKey @"hasBeenVisited"
#define kIsThumbsDownedKey @"isThumbsDowned"

@interface LCHStoredVenueData : NSObject <NSCoding>

@property(nonatomic) NSString *venueID;
@property(nonatomic) NSMutableArray *comments;
@property(assign) BOOL hasBeenVisited;
@property(assign) BOOL isThumbsDowned;

- (instancetype)initWithDictionary:(NSDictionary*)dict;

@end
