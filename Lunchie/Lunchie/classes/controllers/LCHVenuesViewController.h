//
//  LCHVenuesViewController.h
//  Lunchie
//
//  Created by Jabari on 11/24/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LCHVenuePanel;
@class LCHFoursquareVenue;

@protocol LCHVenuesDelegate <NSObject>

- (void)refreshVenues;
- (void)venuePanelWasTapped:(LCHVenuePanel*)venuePanel;
- (void)thumbsDownWasTapped:(LCHFoursquareVenue*)venue isThumbsDown:(BOOL)isThumbsDown;
- (void)reviewsWasTapped:(LCHFoursquareVenue*)venue;
- (void)menuWasTapped:(LCHFoursquareVenue*)venue;
- (void)backButtonwasTapped:(LCHVenuePanel*)venuePanel;
- (void)panelDidFinishClosing:(LCHVenuePanel*)venuePanel;

@end

@interface LCHVenuesViewController : UIViewController <LCHVenuesDelegate>

@end
