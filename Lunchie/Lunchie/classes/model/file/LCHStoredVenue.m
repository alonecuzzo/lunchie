//
//  LCHStoredVenue.m
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHStoredVenue.h"
#import "LCHStoredVenueDatabase.h"

#define kDataKey        @"Data"
#define kDataFile       @"data.plist"

@implementation LCHStoredVenue

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
        _data = [[LCHStoredVenueData alloc] initWithDictionary:dict];
    }
    return self;
}

- (instancetype)initWithDocPath:(NSString *)docPath {
    self = [super init];
    if (self) {
        _docPath = [docPath copy];
    }
    return self;
}

- (BOOL)createDataPath
{
    if (_docPath == nil)
        self.docPath = [LCHStoredVenueDatabase nextStoredVenuePath];
    
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:_docPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (!success)
        NSLog(@"Error creating data path: %@", [error localizedDescription]);
    
    return success;
}

- (LCHStoredVenueData*)data
{
    if (_data != nil)
        return _data;
    
    NSString *dataPath = [_docPath stringByAppendingPathComponent:kDataFile];
    NSData *codedData = [[NSData alloc] initWithContentsOfFile:dataPath];
    
    if (codedData == nil)
        return nil;
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
    _data = [unarchiver decodeObjectForKey:kDataKey];
    [unarchiver finishDecoding];
    
    return _data;
}

- (void)saveData
{
    if (_data == nil)
        return;
    
    [self createDataPath];
    
    NSString *dataPath = [_docPath stringByAppendingPathComponent:kDataFile];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:_data forKey:kDataKey];
    [archiver finishEncoding];
    [data writeToFile:dataPath atomically:YES];
    
    NSLog(@"saving thumbs downed!, %d", _data.isThumbsDowned);
}

- (void)addComment:(NSString*)comment
{
    if (_data.comments) {
        [_data.comments addObject:comment];
    } else {
        _data.comments = [NSMutableArray arrayWithObject:comment];
    }
}

@end
