//
//  LCHIntroViewController.h
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EAIntroView/EAIntroPage.h>
#import <EAIntroView/EAIntroView.h>

@protocol LCHIntroViewDelegate <NSObject>

- (void)facebookButtonWasPressedForNameTextView:(UITextView*)textView;
- (void)twitterButtonWasPressedForNameTextView:(UITextView*)textView;
- (void)donePressed;

@end

@interface LCHIntroViewController : UIViewController <EAIntroDelegate, LCHIntroViewDelegate>

@end
