//
//  LCHMenuSection.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHMenuSection.h"

@implementation LCHMenuSection

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
        _sectionID = [dict valueForKey:@"sectionId"];
        _sectionName = [dict valueForKey:@"name"];
    }
    return self;
}

@end
