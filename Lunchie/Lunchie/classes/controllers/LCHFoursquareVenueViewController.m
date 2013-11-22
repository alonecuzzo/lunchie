//
//  LCHVenueViewController.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHFoursquareVenueViewController.h"
#import "LCHMenuTableViewController.h"
#import "LCHReviewViewController.h"
#import "LCHStoredVenue.h"
#import "LCHModel.h"
#import "LCHStoredVenueData.h"

@interface LCHFoursquareVenueViewController ()

@property(nonatomic) UIButton *thumbsButton;

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

- (instancetype)initWithVenue:(LCHFoursquareVenue*)venue
{
    self = [super init];
    if (self) {
        self.venue = venue;
        [self setupThumbButton];
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
    [writeReviewButton addTarget:self action:@selector(reviewButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:writeReviewButton];
}

- (void)setupThumbButton
{
    _thumbsButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 170, 40)];
    [_thumbsButton setBackgroundColor:[UIColor greenColor]];
    [_thumbsButton addTarget:self action:@selector(thumbsButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [_thumbsButton setTitle:@"thumbsdown" forState:UIControlStateNormal];
    
    if (self.venue.storedVenue) {
        
        if (!self.venue.storedVenue.data.isThumbsDowned) {
            [_thumbsButton setTitle:@"thumbsup" forState:UIControlStateNormal];
        }
    }
    
    [self.view addSubview:_thumbsButton];
    [self.navigationController setTitle:self.venue.venueName];
}

- (void)thumbsButtonPressed
{
    if ([_thumbsButton.titleLabel.text isEqualToString:@"thumbsdown"])
        [_thumbsButton setTitle:@"thumbsup" forState:UIControlStateNormal];
    else
        [_thumbsButton setTitle:@"thumbsdown" forState:UIControlStateNormal];
    
    BOOL isThumbsDowned = ([_thumbsButton.titleLabel.text isEqualToString:@"thumbsdown"]) ? YES : NO;
    NSLog(@"isthumbsdown: %d", isThumbsDowned);
    if (!self.venue.storedVenue) {
        NSDictionary *svDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:isThumbsDowned], kIsThumbsDownedKey, self.venue.venueID, kVenueIDKey, nil];
        LCHStoredVenue *sv = [[LCHStoredVenue alloc] initWithDictionary:svDict];
        self.venue.storedVenue = sv;
        [[LCHModel sharedInstance] writeStoredVenue:sv];
    } else {
        [self.venue.storedVenue toggleThumbsDowned];
        [[LCHModel sharedInstance] writeStoredVenue:self.venue.storedVenue];
    }
}

- (void)getMenuPressed
{
    LCHMenuTableViewController *mtvc = [[LCHMenuTableViewController alloc] init];
    mtvc.venueID = self.venue.venueID;
    [self.navigationController pushViewController:mtvc animated:YES];
}

- (void)reviewButtonPressed
{
    LCHReviewViewController *rvc = [[LCHReviewViewController alloc] init];
    rvc.venue = self.venue;
    [self.navigationController pushViewController:rvc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
