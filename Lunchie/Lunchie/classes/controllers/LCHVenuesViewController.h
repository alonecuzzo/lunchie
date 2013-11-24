//
//  LCHVenuesViewController.h
//  Lunchie
//
//  Created by Jabari on 11/24/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LCHVenuePanel;

@protocol LCHVenuesDelegate <NSObject>

- (void)refreshVenues;
- (void)venuePanelWasTapped:(LCHVenuePanel*)venuePanel;

@end

@interface LCHVenuesViewController : UIViewController <LCHVenuesDelegate>

@end
