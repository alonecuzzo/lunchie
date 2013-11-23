//
//  LCHIntroViewController.m
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHIntroViewController.h"
#import "LCHSignupViewController.h"
#import "LCHFontHelper.h"
#import "LCHIntroView.h"

@interface LCHIntroViewController ()

@end

@implementation LCHIntroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    EAIntroView *introView = [[EAIntroView alloc] initWithFrame:self.view.frame andPages:@[page1, page2]];
    [introView.skipButton setHidden:YES];
    introView.delegate = self;
    [introView showInView:self.view animateDuration:0.0f];
}

#pragma mark - delegate stuff

- (void)introDidFinish:(EAIntroView *)introView
{
    LCHSignupViewController *suvc = [[LCHSignupViewController alloc] init];
    [self.navigationController pushViewController:suvc animated:YES];
}

- (void)intro:(EAIntroView *)introView pageAppeared:(EAIntroPage *)page withIndex:(NSInteger)pageIndex
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
