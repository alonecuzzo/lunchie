//
//  LCHVenuesViewController.m
//  Lunchie
//
//  Created by Jabari on 11/24/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHVenuesViewController.h"
#import "LCHColorHelper.h"
#import "LCHNetworkManager.h"

@interface LCHVenuesViewController ()

@property(nonatomic) UIView *navBar;
@property(nonatomic) LCHNetworkManager *manager;
@property(nonatomic) NSArray *venues;

@end

@implementation LCHVenuesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _manager = [[LCHNetworkManager alloc] init];
        _manager.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *bkgrndView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"intro_bkgrnd_1"]];
    [self.view addSubview:bkgrndView];
    
    _navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    _navBar.backgroundColor = [LCHColorHelper lunchieRed];
    [self.view addSubview:_navBar];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:40.712840 longitude:-74.007742];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [_manager searchVenuesForLocation:location];
    });
}

#pragma mark - delegate stuff
- (void)refreshVenues
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
