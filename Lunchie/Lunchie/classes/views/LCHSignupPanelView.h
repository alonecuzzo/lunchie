//
//  LCHSignupPanelView.h
//  Lunchie
//
//  Created by Jabari on 11/23/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCHIntroViewController.h"

@interface LCHSignupPanelView : UIView

@property(weak) id <LCHIntroViewDelegate> introDelegate;

- (void)hideKeyboard;

@end
