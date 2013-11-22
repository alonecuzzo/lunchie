//
//  LCHStoredVenueData.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHStoredVenueData.h"

#define kVenueIDKey @"venueID"
#define kCommentsKey @"comments"
#define kHasBeenVisitedKey @"hasBeenVisited"
#define kIsLikedKey @"isLiked"

@implementation LCHStoredVenueData

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
        _venueID = [dict objectForKey:kVenueIDKey];
        _comments = [dict objectForKey:kCommentsKey];
        _hasBeenVisited = [[dict objectForKey:kHasBeenVisitedKey] intValue];
        _isLiked = [[dict objectForKey:kIsLikedKey] intValue];
    }
    return self;
}

#pragma mark - nscoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_venueID forKey:kVenueIDKey];
    [aCoder encodeObject:_comments forKey:kCommentsKey];
    [aCoder encodeObject:[NSNumber numberWithInt:_hasBeenVisited] forKey:kHasBeenVisitedKey];
    [aCoder encodeObject:[NSNumber numberWithInt:_isLiked] forKey:kIsLikedKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSString *venueID = [aDecoder decodeObjectForKey:kVenueIDKey];
    NSArray *comments = [aDecoder decodeObjectForKey:kCommentsKey];
    NSNumber *hasBeenVisited = [aDecoder decodeObjectForKey:kHasBeenVisitedKey];
    NSNumber *isLiked = [aDecoder decodeObjectForKey:kIsLikedKey];
    NSDictionary *initDict = [NSDictionary dictionaryWithObjectsAndKeys:venueID, kVenueIDKey, comments, kCommentsKey, hasBeenVisited, kHasBeenVisitedKey, isLiked, kIsLikedKey, nil];
    return [self initWithDictionary:initDict];
}

@end
