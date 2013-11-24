//
//  LCHSocialMediaButton.m
//  Lunchie
//
//  Created by Jabari on 11/23/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHSocialMediaButton.h"
#import "LCHColorHelper.h"
#import "LCHFontHelper.h"

@implementation LCHSocialMediaButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[LCHColorHelper lunchieDarkGrey]];
        self.titleLabel.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall-3];
        self.titleLabel.textColor = [LCHColorHelper lunchieLightGrey];
        self.titleLabel.textAlignment = NSTextAlignmentRight;
    }
    return self;
}

@end
