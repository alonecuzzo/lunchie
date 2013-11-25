//
//  LCHVenuePanel.h
//  Lunchie
//
//  Created by Jabari on 11/24/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCHFoursquareVenue.h"
#import "LCHVenuesViewController.h"

@interface LCHVenuePanel : UIView

@property(weak) id <LCHVenuesDelegate> venueDelegate;

- (instancetype)initWithVenue:(LCHFoursquareVenue*)venue andParentFrame:(CGRect)frame;
- (void)openPanel;
- (void)closePanel;

@end
