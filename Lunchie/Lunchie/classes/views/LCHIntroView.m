//
//  LCHIntroView.m
//  Lunchie
//
//  Created by Jabari on 11/23/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHIntroView.h"
#import "LCHFontHelper.h"
#import "LCHColorHelper.h"

@implementation LCHIntroView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        float leftMargin = 40.0f;
        float topMargin = 200.0f;
        float labelWidth = self.frame.size.width - (2*leftMargin);
        
        UIView *bkgrndView = [[UIView alloc] initWithFrame:CGRectMake(leftMargin - 10, topMargin - 5, labelWidth + 20, 80)];
        bkgrndView.backgroundColor = [LCHColorHelper lunchieRed];
        [self addSubview:bkgrndView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, topMargin, labelWidth, 70)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
        _titleLabel.textColor = [LCHColorHelper lunchieLightGrey];
        _titleLabel.numberOfLines = 0;
        [self addSubview:_titleLabel];
        
        _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, _titleLabel.frame.size.height + _titleLabel.frame.origin.y + 10, _titleLabel.frame.size.width, 200)];
        _descriptionLabel.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
        _descriptionLabel.textAlignment = NSTextAlignmentCenter;
        _descriptionLabel.textColor = [LCHColorHelper lunchieLightGrey];
        _descriptionLabel.numberOfLines = 0;
        [self addSubview:_descriptionLabel];
    }
    return self;
}

@end
