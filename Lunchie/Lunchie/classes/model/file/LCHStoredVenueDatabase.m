//
//  LCHStoredVenueDatabase.m
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHStoredVenueDatabase.h"
#import "LCHStoredVenueData.h"

@implementation LCHStoredVenueDatabase

+ (NSString*)getPrivateDocsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"Private Documents"];
    
    NSError *error;
    [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    
    return documentsDirectory;
}

+ (NSMutableArray*)loadStoredVenueData
{
    NSString *documentsDirectory = [LCHStoredVenueDatabase getPrivateDocsDirectory];
    NSLog(@"Loading venues from %@", documentsDirectory);
    
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&error];
    if (files == nil) {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
        return nil;
    }
    
    NSMutableArray *retval = [NSMutableArray arrayWithCapacity:files.count];
    for (NSString *file in files) {
        if ([file.pathExtension compare:@"scarybug" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:file];
//            ScaryBugDoc *doc = [[[ScaryBugDoc alloc] initWithDocPath:fullPath] autorelease];
//            [retval addObject:doc];
        }
    }
    
    return retval;

}

+ (NSString*)nextStoredVenuePath
{
    NSString *documentsDirectory = [LCHStoredVenueDatabase getPrivateDocsDirectory];
    
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&error];
    if (files == nil) {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
        return nil;
    }
    
    int maxNumber = 0;
    for (NSString *file in files) {
        if ([file.pathExtension compare:@"storedvenue" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            NSString *fileName = [file stringByDeletingPathExtension];
            maxNumber = MAX(maxNumber, fileName.intValue);
        }
    }
    
    NSString *availableName = [NSString stringWithFormat:@"%d.storedvenue", maxNumber+1];
    return [documentsDirectory stringByAppendingPathComponent:availableName];
}

@end
