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

- (LCHMenu*)buildMenuFromJSON:(NSDictionary*)json
{
    NSDictionary *responseJSON = [json objectForKey:@"response"];
    NSDictionary *menuJSON = [responseJSON objectForKey:@"menu"];
    NSDictionary *menusJSON = [menuJSON objectForKey:@"menus"];
    NSArray *itemsArray= [menusJSON objectForKey:@"items"];
    NSDictionary *firstMenuJSON = [itemsArray objectAtIndex:0];
    NSDictionary *entriesJSON = [firstMenuJSON objectForKey:@"entries"];
    NSDictionary *itemsArray2 = [entriesJSON objectForKey:@"items"];
    
    LCHMenu *menu = [[LCHMenu alloc] initWithDictionary:firstMenuJSON];
    LCHMenuSection *menuSection;
    LCHMenuEntry *menuEntry;
    NSMutableArray *tmpSectionArray = [NSMutableArray array];
    NSMutableArray *tmpEntryArray;
    
    for (NSDictionary *section in itemsArray2) {
        menuSection = [[LCHMenuSection alloc] initWithDictionary:section];
        NSDictionary *innerEntriesJSON = [section objectForKey:@"entries"];
        NSArray *innerItemsArray = [innerEntriesJSON objectForKey:@"items"];
        for (NSDictionary *entry in innerItemsArray) {
            tmpEntryArray = [NSMutableArray array];
            menuEntry = [[LCHMenuEntry alloc] initWithDictionary:entry];
            [tmpEntryArray addObject:menuEntry];
        }
        menuSection.entries = (NSArray*)tmpEntryArray;
        [tmpSectionArray addObject:menuSection];
    }
    menu.menuSections = (NSArray*)tmpSectionArray;
    return menu;
}

@end
