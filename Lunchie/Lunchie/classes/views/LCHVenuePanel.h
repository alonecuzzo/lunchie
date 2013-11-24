//
//  LCHVenuePanel.h
//  Lunchie
//
//  Created by Jabari on 11/24/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCHFoursquareVenue.h"

@interface LCHVenuePanel : UIView

- (instancetype)initWithVenue:(LCHFoursquareVenue*)venue andFrame:(CGRect)frame;

@end
