//
//  LCHViewController.m
//  Lunchie
//
//  Created by Jabari on 11/20/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHViewController.h"
#import "LCHNetworkManager.h"
#import "LCHFoursquareService.h"
#import "LCHFoursquareVenue.h"
#import "LCHModel.h"
#import "LCHFoursquareVenueViewController.h"

@interface LCHViewController ()

@property(nonatomic) NSArray *venues;

@end

@implementation LCHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:40.712840 longitude:-74.007742];
    LCHNetworkManager *manager = [[LCHNetworkManager alloc] init];
    manager.delegate = self;
    [manager searchVenuesForLocation:location];
    
}

#pragma mark - lchtableviewdelegate stuff
- (void)refreshVenues
{
    _venues = [[LCHModel sharedInstance] venues];
    [self.tableView reloadData];
}

#pragma mark - uitableviewdelegate stuff

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCHFoursquareVenueViewController *lvc = [[LCHFoursquareVenueViewController alloc] initWithVenue:[_venues objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:lvc animated:YES];
}

#pragma mark - datasourcedelegate goodies

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (_venues) ? [_venues count] : 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    LCHFoursquareVenue *venue = [_venues objectAtIndex:indexPath.row];
    cell.textLabel.text = venue.venueName;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
