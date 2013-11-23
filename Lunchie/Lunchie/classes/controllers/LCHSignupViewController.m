//
//  LCHSignupViewController.m
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHSignupViewController.h"
#import "LCHSocialManager.h"
#import "LCHVenuesTableViewController.h"

@interface LCHSignupViewController ()

@property(nonatomic) LCHSocialManager *manager;
@property(nonatomic) UILabel *nameLabel;

@end

@implementation LCHSignupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor purpleColor];
        _manager = [[LCHSocialManager alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 40, 150, 40)];
    [_nameLabel setBackgroundColor:[UIColor whiteColor]];
    _nameLabel.text = @"name";
    [self.view addSubview:_nameLabel];
    
    UIButton *facebookButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 80, 100, 40)];
    [facebookButton addTarget:self action:@selector(facebookPress) forControlEvents:UIControlEventTouchUpInside];
    [facebookButton setBackgroundColor:[UIColor blueColor]];
    [facebookButton setTitle:@"facebooks" forState:UIControlStateNormal];
    [self.view addSubview:facebookButton];
   
    UIButton *twitterButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 180, 100, 40)];
    [twitterButton addTarget:self action:@selector(twitterPress) forControlEvents:UIControlEventTouchUpInside];
    [twitterButton setBackgroundColor:[UIColor redColor]];
    [twitterButton setTitle:@"twitters" forState:UIControlStateNormal];
    [self.view addSubview:twitterButton];
    
    UIButton *doneButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 280, 100, 40)];
    [doneButton addTarget:self action:@selector(donePress) forControlEvents:UIControlEventTouchUpInside];
    [doneButton setBackgroundColor:[UIColor grayColor]];
    [doneButton setTitle:@"done" forState:UIControlStateNormal];
    [self.view addSubview:doneButton];
    
}

- (void)facebookPress
{
    [_manager fullnameFromFacebookWithCompletionBlock:^(NSString *fullName) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _nameLabel.text = fullName;
        });
    }];
}

- (void)twitterPress
{
    [_manager screenameFromTwitterWithCompletionBlock:^(NSString *screename) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _nameLabel.text = screename;
        });
    }];
}

- (void)donePress

{
    LCHVenuesTableViewController *vtc = [[LCHVenuesTableViewController alloc] init];
    [self.navigationController pushViewController:vtc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
