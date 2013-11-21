//
//  LCHFoursquareService.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHFoursquareService.h"
#import <FSNetworking/FSNConnection.h>

#define FS_CLIENT_ID @"2CH4H1ZRVZJWGGKJVYBJY1HN3TX5HMWFZTT1V1JRAPBOXNPM"
#define FS_CLIENT_SECRET @"L35ZA0AD2PJQMTAEPMRL0M5IGIXGUPWBE03L4BIAH21M0SLJ"

static NSString *const FS_SEARCH_URL = @"https://api.foursquare.com/v2/venues/search";
static NSString *const FS_MENU_URL = @"https://api.foursquare.com/v2/venues/";

@implementation LCHFoursquareService

- (instancetype)initWithDelegate:(id<LCHNetworkManagerProtocol>)delegate
{
    self = [super init];
    if (self) {
        _delegate = delegate;
    }
    return self;
}

- (void)searchVenuesForLocation:(CLLocation*)location
{
    __block id delegate = self.delegate;
    NSURL *url = [NSURL URLWithString:FS_SEARCH_URL];
    NSString *locationString = [NSString stringWithFormat:@"%f,%f", location.coordinate.latitude, location.coordinate.longitude];
    NSDictionary *params = [NSDictionary dictionaryWithObjects:@[
                                                        locationString,
                                                        FS_CLIENT_ID,
                                                        FS_CLIENT_SECRET,
                                                        @"restaurant",
                                                        @"20130815"
                                                     ] forKeys:@[
                                                        @"ll",
                                                        @"client_id",
                                                        @"client_secret",
                                                        @"query",
                                                        @"v"
                                                     ]
   ];
   
   FSNConnection *connection = [FSNConnection withUrl:url method:FSNRequestMethodGET headers:nil parameters:params
       parseBlock:^id(FSNConnection *connection, NSError **error) {
           
           return connection;
       } completionBlock:^(FSNConnection *connection) {
           NSLog(@"complete! %@ :: %@", connection.responseData, connection.error);
           
           if (!connection.error) {
               NSError *error = nil;
               NSDictionary *json = [NSJSONSerialization JSONObjectWithData:connection.responseData options:kNilOptions error:&error];
               NSLog(@"json: %@", json);
               [delegate buildVenuesWithJSON:json];
           }
           
       } progressBlock:^(FSNConnection *connection) {
           
       }
    ];
    
    [connection start];
}

- (void)searchMenuForVenueID:(NSString*)venueID
{
    __block id delegate = self.delegate;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", FS_MENU_URL, venueID, @"/menu"]];
    NSDictionary *params = [NSDictionary dictionaryWithObjects:@[
                                                                 FS_CLIENT_ID,
                                                                 FS_CLIENT_SECRET,
                                                                 @"20130815"
                                                                 ] forKeys:@[
                                                                             @"client_id",
                                                                             @"client_secret",
                                                                             @"v"
                                                                             ]
                            ];
    
    FSNConnection *connection = [FSNConnection withUrl:url method:FSNRequestMethodGET headers:nil parameters:params
                                            parseBlock:^id(FSNConnection *connection, NSError **error) {
                                                
                                                return connection;
                                            } completionBlock:^(FSNConnection *connection) {
                                                NSLog(@"complete! %@ :: %@", connection.responseData, connection.error);
                                                
                                                if (!connection.error) {
                                                    NSError *error = nil;
                                                    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:connection.responseData options:kNilOptions error:&error];
                                                    NSLog(@"json: %@", json);
                                                    [delegate buildMenuWithJSON:json];
                                                }
                                                
                                            } progressBlock:^(FSNConnection *connection) {
                                                
                                            }
                                 ];
    
    [connection start];

}

@end
