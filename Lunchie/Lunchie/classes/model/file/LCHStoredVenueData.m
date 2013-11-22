//
//  LCHStoredVenueData.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHStoredVenueData.h"

@implementation LCHStoredVenueData

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
        _venueID = [dict objectForKey:kVenueIDKey];
        _comments = [dict objectForKey:kCommentsKey];
        _hasBeenVisited = [[dict objectForKey:kHasBeenVisitedKey] boolValue];
        _isThumbsDowned = [[dict objectForKey:kIsThumbsDownedKey] boolValue];
    }
    return self;
}

#pragma mark - nscoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_venueID forKey:kVenueIDKey];
    [aCoder encodeObject:_comments forKey:kCommentsKey];
    [aCoder encodeObject:[NSNumber numberWithBool:_hasBeenVisited] forKey:kHasBeenVisitedKey];
    [aCoder encodeBool:_isThumbsDowned forKey:kIsThumbsDownedKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSString *venueID = [aDecoder decodeObjectForKey:kVenueIDKey];
    NSArray *comments = [aDecoder decodeObjectForKey:kCommentsKey];
    NSNumber *hasBeenVisited = [aDecoder decodeObjectForKey:kHasBeenVisitedKey];
    BOOL isThumbsDowned = [aDecoder decodeBoolForKey:kIsThumbsDownedKey];
    NSDictionary *initDict = [NSDictionary dictionaryWithObjectsAndKeys:venueID, kVenueIDKey, comments, kCommentsKey, hasBeenVisited, kHasBeenVisitedKey, [NSNumber numberWithBool:isThumbsDowned], kIsThumbsDownedKey, nil];
    return [self initWithDictionary:initDict];
}

@end
