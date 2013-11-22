//
//  LCHVenueViewController.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCHFoursquareVenue.h"

@interface LCHFoursquareVenueViewController : UIViewController

@property(nonatomic) LCHFoursquareVenue *venue;

- (instancetype)initWithVenue:(LCHFoursquareVenue*)venue;

@end
