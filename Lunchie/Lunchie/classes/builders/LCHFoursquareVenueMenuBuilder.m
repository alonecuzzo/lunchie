//
//  LCHFoursquareVenueMenuBuilder.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHFoursquareVenueMenuBuilder.h"
#import "LCHMenu.h"
#import "LCHMenuEntry.h"
#import "LCHMenuSection.h"

@implementation LCHFoursquareVenueMenuBuilder

- (void)buildMenuFromJSON:(NSDictionary*)json
{
    NSDictionary *responseJSON = [json objectForKey:@"response"];
    NSDictionary *menuJSON = [responseJSON objectForKey:@"menu"];
    NSDictionary *menusJSON = [menuJSON objectForKey:@"menus"];
    NSArray *itemsArray= [menusJSON objectForKey:@"items"];
    NSDictionary *firstMenuJSON = [itemsArray objectAtIndex:0];
    
    LCHMenu *menu = [[LCHMenu alloc] initWithDictionary:firstMenuJSON];
    NSLog(@"menu name: %@", menu.menuName);
    NSLog(@"menu id: %@", menu.menuID);
    
}

@end
