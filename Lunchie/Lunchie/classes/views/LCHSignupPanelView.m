//
//  LCHSignupPanelView.m
//  Lunchie
//
//  Created by Jabari on 11/23/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHSignupPanelView.h"
#import "LCHFontHelper.h"
#import "LCHColorHelper.h"

@interface LCHSignupPanelView()

@property(strong) UITextView *yourNameTextView;
@property(strong) UITextView *yourTeamTextView;

@end

@implementation LCHSignupPanelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *bkgrndView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        bkgrndView.backgroundColor = [LCHColorHelper lunchieLightGrey];
        bkgrndView.alpha = 0.8f;
        UITapGestureRecognizer *tapRecognizer =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
        [self addSubview:bkgrndView];
        [bkgrndView addGestureRecognizer:tapRecognizer];
        
        UIView *headerBkgrnd = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
        headerBkgrnd.backgroundColor = [LCHColorHelper lunchieRed];
        [self addSubview:headerBkgrnd];
        
        UILabel *signUpTitle = [[UILabel alloc] initWithFrame:headerBkgrnd.frame];
        signUpTitle.text = @"Sign Up";
        signUpTitle.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
        signUpTitle.textColor = [LCHColorHelper lunchieLightGrey];
        signUpTitle.textAlignment = NSTextAlignmentCenter;
        [self addSubview:signUpTitle];
        
        float leftMargin = 20;
        float headerHeight = headerBkgrnd.frame.size.height;
        float labelHeight = 20;
        float textFieldHeight = 40;
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, headerHeight + leftMargin, self.frame.size.width, labelHeight)];
        nameLabel.text = @"Your Name";
        nameLabel.textColor = [LCHColorHelper lunchieDarkGrey];
        nameLabel.font = signUpTitle.font;
        [self addSubview:nameLabel];
        
        _yourNameTextView = [[UITextView alloc] initWithFrame:CGRectMake(leftMargin, nameLabel.frame.size.height + nameLabel.frame.origin.y + leftMargin / 2, self.frame.size.width - 2 * leftMargin, textFieldHeight)];
        _yourNameTextView.font = nameLabel.font;
        _yourNameTextView.textColor = [LCHColorHelper lunchieBlack];
        _yourNameTextView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_yourNameTextView];
        
        UILabel *teamLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, _yourNameTextView.frame.size.height + _yourNameTextView.frame.origin.y + leftMargin, self.frame.size.width, labelHeight)];
        teamLabel.text = @"Your Team";
        teamLabel.textColor = [LCHColorHelper lunchieDarkGrey];
        teamLabel.font = signUpTitle.font;
        [self addSubview:teamLabel];
        
        _yourTeamTextView = [[UITextView alloc] initWithFrame:CGRectMake(leftMargin, teamLabel.frame.size.height + teamLabel.frame.origin.y + leftMargin / 2, self.frame.size.width - 2 * leftMargin, textFieldHeight)];
        _yourTeamTextView.font = nameLabel.font;
        _yourTeamTextView.textColor = [LCHColorHelper lunchieBlack];
        _yourTeamTextView.backgroundColor = [UIColor whiteColor];
        _yourTeamTextView.userInteractionEnabled = NO;
        _yourTeamTextView.text = @"Fueled";
        [self addSubview:_yourTeamTextView];
        
        
        
    }
    return self;
}

- (void)hideKeyboard
{
    [_yourNameTextView resignFirstResponder];
}

@end
