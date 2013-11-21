//
//  LCHMenu.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHMenu.h"

@implementation LCHMenu

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
        _menuID = [dict objectForKey:@"menuId"];
        _menuName = [dict objectForKey:@"name"];
    }
    return self;
}

@end
