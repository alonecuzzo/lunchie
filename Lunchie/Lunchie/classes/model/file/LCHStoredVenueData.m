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
        NSLog(@"building is thumbs down:: %d, ", _isThumbsDowned);
    }
    return self;
}

#pragma mark - nscoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_venueID forKey:kVenueIDKey];
    [aCoder encodeObject:_comments forKey:kCommentsKey];
    [aCoder encodeBool:_hasBeenVisited forKey:kHasBeenVisitedKey];
    [aCoder encodeBool:_isThumbsDowned forKey:kIsThumbsDownedKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSString *venueID = [aDecoder decodeObjectForKey:kVenueIDKey];
    NSArray *comments = [aDecoder decodeObjectForKey:kCommentsKey];
    BOOL hasBeenVisited = [aDecoder decodeBoolForKey:kHasBeenVisitedKey];
    BOOL isThumbsDowned = [aDecoder decodeBoolForKey:kIsThumbsDownedKey];
    //cheating and setting isThumbsDown here, for some reason it started losing it's value when it was passed through the dictionary... weird, not enough time to fully fix so inserting this bool hack here for now
    _isThumbsDowned = isThumbsDowned;
    NSDictionary *initDict = [NSDictionary dictionaryWithObjectsAndKeys:venueID, kVenueIDKey, comments, kCommentsKey, [NSNumber numberWithBool:hasBeenVisited], kHasBeenVisitedKey, [NSNumber numberWithBool:isThumbsDowned], kIsThumbsDownedKey, nil];
    return [self initWithDictionary:initDict];
}

@end
