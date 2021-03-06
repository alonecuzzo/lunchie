//
//  LCHMenuTableViewController.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LCHMenu;

@protocol LCHMenuTableViewControllerDelegate <NSObject>

- (void)refreshMenu;

@end

@interface LCHMenuTableViewController : UIViewController <LCHMenuTableViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property(nonatomic) NSString *venueID;
@property(nonatomic) UITableView *tableView;

@end
