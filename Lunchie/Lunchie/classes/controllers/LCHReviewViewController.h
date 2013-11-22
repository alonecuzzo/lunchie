//
//  LCHReviewViewController.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCHFoursquareVenue.h"
#import "HPGrowingTextView.h"

@interface LCHReviewViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, HPGrowingTextViewDelegate>

@property(nonatomic) LCHFoursquareVenue *venue;
@property(nonatomic) UITableView *tableView;

@end
