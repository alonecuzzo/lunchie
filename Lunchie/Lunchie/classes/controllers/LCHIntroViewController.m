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
//    page1.title = @"Too many lunch choices got you bogged down??";
//    page1.titleFont = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
//    page1.desc = @"LMOAZ AT THE LOLZ!!!";
    [page1 setBgImage:[UIImage imageNamed:@"intro_bkgrnd_1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"WTF Z GOING ON?!";
    page2.desc = @"AGAINZO AAGIAN!!! LMOAZ AT THE LOLZ!!!";
    
    EAIntroView *introView = [[EAIntroView alloc] initWithFrame:self.view.frame andPages:@[page1, page2]];
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
