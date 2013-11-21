//
//  LCHMenuItem.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHMenuEntry.h"

@implementation LCHMenuEntry

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super self];
    if (self) {
        _entryID = [dict valueForKey:@"entryId"];
        _entryName = [dict valueForKey:@"name"];
        _entryDescription = [dict valueForKey:@"description"];
    }
    return self;
}

@end
