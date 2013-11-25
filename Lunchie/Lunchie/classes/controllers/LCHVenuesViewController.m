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
#import <stdlib.h>
#import "LCHModel.h"
#import "LCHFoursquareVenue.h"
#import "LCHVenuePanel.h"
#import <EAIntroPage.h>
#import <EAIntroView.h>
#import "LCHStoredVenue.h"
#import "LCHMenuTableViewController.h"
#import "LCHReviewViewController.h"

@interface LCHVenuesViewController ()

@property(nonatomic) UIView *navBar;
@property(nonatomic) LCHNetworkManager *manager;
@property(nonatomic) NSArray *venues;
@property(nonatomic) NSMutableArray *venuesToDisplay;
@property(nonatomic) EAIntroView *venuePagerView;
@property(nonatomic) UIView *panelParent;

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
    
    _venuesToDisplay = [NSMutableArray array];
    
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
    _venues = [[LCHModel sharedInstance] venues];
    [self chooseVenuesToDisplay];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableArray *pages = [NSMutableArray array];
        for (LCHFoursquareVenue *venue in _venuesToDisplay) {
            LCHVenuePanel *venuePanel = [[LCHVenuePanel alloc] initWithVenue:venue andParentFrame:self.view.frame];
            venuePanel.venueDelegate = self;
            EAIntroPage *page = [EAIntroPage page];
            page.bgImage = [UIImage imageNamed:@"intro_bkgrnd_2"];
            page.customView = venuePanel;
            [pages addObject:page];
        }
        _venuePagerView = [[EAIntroView alloc] initWithFrame:self.view.frame andPages:pages];
        [_venuePagerView showInView:self.view animateDuration:0.3f];
        _venuePagerView.swipeToExit = NO;
        [_venuePagerView.skipButton setHidden:YES];
        //helps with coordinate system later, not giving the venuepager a smaller frame
        [_navBar removeFromSuperview];
        [self.view addSubview:_navBar];
    });
}

- (void)venuePanelWasTapped:(LCHVenuePanel *)venuePanel
{
    _panelParent = venuePanel.superview;
    [_venuePagerView setHidden:YES];
    [venuePanel removeFromSuperview];
    [self.view addSubview:venuePanel];
    [venuePanel openPanel];
}

- (void)thumbsDownWasTapped:(LCHFoursquareVenue *)venue isThumbsDown:(BOOL)isThumbsDown
{
    if (!venue.storedVenue) {
        NSDictionary *svDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:isThumbsDown], kIsThumbsDownedKey, venue.venueID, kVenueIDKey, nil];
        LCHStoredVenue *sv = [[LCHStoredVenue alloc] initWithDictionary:svDict];
        venue.storedVenue = sv;
        [[LCHModel sharedInstance] writeStoredVenue:sv];
    } else {
        [venue.storedVenue toggleThumbsDowned];
        [[LCHModel sharedInstance] writeStoredVenue:venue.storedVenue];
    }
}

- (void)reviewsWasTapped:(LCHFoursquareVenue *)venue
{
    LCHReviewViewController *rvc = [[LCHReviewViewController alloc] init];
    rvc.venue = venue;
    [self.navigationController pushViewController:rvc animated:YES];
}

- (void)menuWasTapped:(LCHFoursquareVenue *)venue
{
    LCHMenuTableViewController *mtvc = [[LCHMenuTableViewController alloc] init];
    mtvc.venueID = venue.venueID;
    [self.navigationController pushViewController:mtvc animated:YES];
}

- (void)backButtonwasTapped:(LCHVenuePanel *)venuePanel
{
    [_venuePagerView setHidden:NO];
    [venuePanel closePanel];
}

- (void)panelDidFinishClosing:(LCHVenuePanel *)venuePanel
{
    [venuePanel removeFromSuperview];
    [_panelParent addSubview:venuePanel];
}

- (void)chooseVenuesToDisplay
{
    for (int i = 0; i < 3; i++) {
        int index = rand() % [_venues count];
        [_venuesToDisplay addObject:_venues[index]];
        NSLog(@"venue: %@", [(LCHFoursquareVenue*)_venues[index] venueName]);
    }
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
