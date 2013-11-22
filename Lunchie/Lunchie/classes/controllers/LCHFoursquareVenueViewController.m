//
//  LCHVenueViewController.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHFoursquareVenueViewController.h"
#import "LCHMenuTableViewController.h"

@interface LCHFoursquareVenueViewController ()

@end

@implementation LCHFoursquareVenueViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *getMenuButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 70, 40)];
    [getMenuButton setBackgroundColor:[UIColor purpleColor]];
    [getMenuButton setTitle:@"menu" forState:UIControlStateNormal];
    [getMenuButton addTarget:self action:@selector(getMenuPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getMenuButton];
    
    UIButton *writeReviewButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 220, 70, 40)];
    [writeReviewButton setBackgroundColor:[UIColor redColor]];
    [writeReviewButton setTitle:@"review" forState:UIControlStateNormal];
    [self.view addSubview:writeReviewButton];
}

- (void)getMenuPressed
{
    LCHMenuTableViewController *mtvc = [[LCHMenuTableViewController alloc] init];
    mtvc.venueID = self.venue.venueID;
    [self.navigationController pushViewController:mtvc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
