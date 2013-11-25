//
//  LCHIntroViewController.m
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHIntroViewController.h"
#import "LCHFontHelper.h"
#import "LCHIntroView.h"
#import "LCHSocialManager.h"
#import "LCHSignupPanelView.h"
#import "LCHVenuesViewController.h"

@interface LCHIntroViewController ()

@property(nonatomic) LCHSocialManager *manager;
@property(nonatomic) LCHSignupPanelView *signupPanelView;

@end

@implementation LCHIntroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _manager = [[LCHSocialManager alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    EAIntroPage *page1 = [EAIntroPage page];
    LCHIntroView *page1View = [[LCHIntroView alloc] initWithFrame:self.view.frame];
    page1View.titleLabel.text = @"Too many restaurant choices got you bogged down??";
    page1View.descriptionLabel.text = @"C'mon man, you know that's a lolcat... Don't lie to me man that IS a lolcat.  Don't you think that's a lolcat cuz I do think it's a locat, I'm going crazy man!";
    page1.customView = page1View;
    [page1 setBgImage:[UIImage imageNamed:@"intro_bkgrnd_1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    LCHIntroView *page2View = [[LCHIntroView alloc] initWithFrame:self.view.frame];
    page2View.titleLabel.text = @"Too many restaurant choices got you bogged down??";
    page2View.descriptionLabel.text = @"C'mon man, you know that's a lolcat... Don't lie to me man that IS a lolcat.  Don't you think that's a lolcat cuz I do think it's a locat, I'm going crazy man!";
    page2.customView = page2View;
    [page2 setBgImage:[UIImage imageNamed:@"intro_bkgrnd_2"]];
    
    EAIntroPage *signupPage = [EAIntroPage page];
    CGSize signupPanelSize = CGSizeMake(self.view.frame.size.width - 60, 370);
    _signupPanelView = [[LCHSignupPanelView alloc] initWithFrame:CGRectMake(30, (self.view.frame.size.height / 2) - (signupPanelSize.height / 2) - 10, signupPanelSize.width, signupPanelSize.height)];
    _signupPanelView.introDelegate = self;
    signupPage.customView = _signupPanelView;
    [signupPage setBgImage:[UIImage imageNamed:@"intro_bkgrnd_2"]];
    
    EAIntroView *introView = [[EAIntroView alloc] initWithFrame:self.view.frame andPages:@[page1, page2, signupPage]];
    [introView.skipButton setHidden:YES];
    introView.delegate = self;
    introView.swipeToExit = NO;
    [introView showInView:self.view animateDuration:0.0f];
}

#pragma mark - delegate stuff

- (void)introDidFinish:(EAIntroView *)introView
{
    
}

- (void)intro:(EAIntroView *)introView pageAppeared:(EAIntroPage *)page withIndex:(NSInteger)pageIndex
{
    [_signupPanelView hideKeyboard];
}

- (void)facebookButtonWasPressedForNameTextView:(UITextView *)textView
{
   [_manager fullnameFromFacebookWithCompletionBlock:^(NSString *fullName) {
        dispatch_async(dispatch_get_main_queue(), ^{
            textView.text = fullName;
        });
   }];
}

- (void)twitterButtonWasPressedForNameTextView:(UITextView *)textView
{
   [_manager screenameFromTwitterWithCompletionBlock:^(NSString *screename) {
        dispatch_async(dispatch_get_main_queue(), ^{
            textView.text = screename;
        });
   }];
}

- (void)donePressed
{
    LCHVenuesViewController *vvc = [[LCHVenuesViewController alloc] init];
    [self.navigationController pushViewController:vvc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

@end
