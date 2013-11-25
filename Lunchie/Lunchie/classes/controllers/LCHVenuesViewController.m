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
#import "LCHFontHelper.h"

@interface LCHVenuesViewController () <UIAlertViewDelegate>

@property(nonatomic) UIView *navBar;
@property(nonatomic) LCHNetworkManager *manager;
@property(nonatomic) NSArray *venues;
@property(nonatomic) NSMutableArray *venuesToDisplay;
@property(nonatomic) EAIntroView *venuePagerView;
@property(nonatomic) UIView *panelParent;
@property(nonatomic) LCHVenuePanel *openPanel;
@property(nonatomic) UILabel *preloader;

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
    
    self.view.backgroundColor = [LCHColorHelper lunchieBlack];
    
    _navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    _navBar.backgroundColor = [LCHColorHelper lunchieRed];
    [self.view addSubview:_navBar];
    
    CGSize preloaderSize = CGSizeMake(280, 30);
    _preloader = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 2) - (preloaderSize.width / 2), (self.view.frame.size.height / 2) - (preloaderSize.height / 2), preloaderSize.width, preloaderSize.height)];
    _preloader.text = @"Loading Venues, please wait...";
    _preloader.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
    _preloader.textColor = [UIColor whiteColor];
    _preloader.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_preloader];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:40.712840 longitude:-74.007742];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [_manager searchVenuesForLocation:location];
    });
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (_openPanel)
        [_openPanel refreshReviewButton];
}

#pragma mark - delegate stuff
- (void)refreshVenues
{
    _venues = [[LCHModel sharedInstance] venues];
    [self chooseVenuesToDisplay];
    dispatch_async(dispatch_get_main_queue(), ^{
        _preloader.hidden = YES;
        NSMutableArray *pages = [NSMutableArray array];
        int i = 0;
        NSString *imageName;
        NSString *bkgrndName;
        for (LCHFoursquareVenue *venue in _venuesToDisplay) {
            switch (i) {
                case 0:
                    imageName = @"pasta";
                    bkgrndName = @"intro_bkgrnd_pasta.png";
                    break;
                    
                case 1:
                    imageName = @"salad";
                    bkgrndName = @"intro_bkgrnd_salad";
                    break;
                    
                case 2:
                    imageName = @"sauce";
                    bkgrndName = @"intro_bkgrnd_2";
                    break;
            }
            LCHVenuePanel *venuePanel = [[LCHVenuePanel alloc] initWithVenue:venue andParentFrame:self.view.frame andImageName:imageName];
            venuePanel.venueDelegate = self;
            EAIntroPage *page = [EAIntroPage page];
            page.bgImage = [UIImage imageNamed:bkgrndName];
            page.customView = venuePanel;
            [pages addObject:page];
            i++;
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
    _openPanel = venuePanel;
    _panelParent = venuePanel.superview;
    [venuePanel removeFromSuperview];
    [self.view addSubview:venuePanel];
    [venuePanel openPanel];
}

- (void)thumbsDownWasTapped:(LCHFoursquareVenue *)venue isThumbsDown:(BOOL)isThumbsDown
{
    if (!venue.storedVenue) {
        NSDictionary *svDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:isThumbsDown], kIsThumbsDownedKey, venue.venueID, kVenueIDKey, nil];
        LCHStoredVenue *sv = [[LCHStoredVenue alloc] initWithDictionary:svDict];
        sv.data.isThumbsDowned = isThumbsDown;
        venue.storedVenue = sv;
        [[LCHModel sharedInstance] writeStoredVenue:sv];
    } else {
        venue.storedVenue.data.isThumbsDowned = isThumbsDown;
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

- (void)sendToTeamWasTapped:(LCHFoursquareVenue *)venue
{
    if (!venue.storedVenue) {
        NSDictionary *svDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], kHasBeenVisitedKey, venue.venueID, kVenueIDKey, nil];
        LCHStoredVenue *sv = [[LCHStoredVenue alloc] initWithDictionary:svDict];
        sv.data.hasBeenVisited = YES;
        venue.storedVenue = sv;
        [[LCHModel sharedInstance] writeStoredVenue:sv];
    } else {
        venue.storedVenue.data.hasBeenVisited = YES;
        [[LCHModel sharedInstance] writeStoredVenue:venue.storedVenue];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Great Success!" message:@"The menu has been sent to your team." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Okay", nil];
        [alert show];
    });
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self backButtonwasTapped:_openPanel];
}

- (void)panelDidFinishClosing:(LCHVenuePanel *)venuePanel
{
    _openPanel = nil;
    [venuePanel removeFromSuperview];
    [_panelParent addSubview:venuePanel];
}

- (void)panelDidFinishOpening
{
    [_venuePagerView setHidden:YES];
}

- (void)chooseVenuesToDisplay
{
    for (int i = 0; i < 3; i++) {
        int index = rand() % [_venues count];
        [_venuesToDisplay addObject:_venues[index]];
        NSLog(@"venue: %@", [(LCHFoursquareVenue*)_venues[index] venueName]);
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
