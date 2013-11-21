//
//  LCHViewController.h
//  Lunchie
//
//  Created by Jabari on 11/20/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@protocol LCHVenuesTableViewDelegate <NSObject>

- (void)refreshVenues;

@end

@interface LCHViewController : UITableViewController <LCHVenuesTableViewDelegate>

@end
