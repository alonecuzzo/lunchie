//
//  LCHVenueViewController.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHFoursquareVenueViewController.h"
#import "LCHNetworkManager.h"

@interface LCHFoursquareVenueViewController ()

@property(nonatomic)LCHNetworkManager *manager;

@end

@implementation LCHFoursquareVenueViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        _manager = [[LCHNetworkManager alloc] init];
        
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
}

- (void)getMenuPressed
{
    [_manager searcMenusForVenueID:self.venue.venueID];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
