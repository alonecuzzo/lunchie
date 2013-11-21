//
//  LCHViewController.m
//  Lunchie
//
//  Created by Jabari on 11/20/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHViewController.h"
#import "LCHFoursquareService.h"

@interface LCHViewController ()

@end

@implementation LCHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [[CLLocation alloc] initWithLatitude:40.712840 longitude:-74.007742];
    LCHFoursquareService *service = [[LCHFoursquareService alloc] init];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:40.712840 longitude:-74.007742];
    [service searchVenuesForLocation:location];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
