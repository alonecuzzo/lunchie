//
//  LCHVenuesViewController.h
//  Lunchie
//
//  Created by Jabari on 11/24/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LCHVenuesDelegate <NSObject>

- (void)refreshVenues;

@end

@interface LCHVenuesViewController : UIViewController <LCHVenuesDelegate>

@end
