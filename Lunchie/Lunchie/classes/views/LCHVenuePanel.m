//
//  LCHVenuePanel.m
//  Lunchie
//
//  Created by Jabari on 11/24/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHVenuePanel.h"
#import "LCHColorHelper.h"
#import "LCHFontHelper.h"

@interface LCHVenuePanel()

@property(nonatomic) LCHFoursquareVenue *venue;

@end

@implementation LCHVenuePanel

- (instancetype)initWithVenue:(LCHFoursquareVenue*)venue andFrame:(CGRect)frame
{
    float leftMargin = 40;
    
    CGRect panelFrame = CGRectMake(leftMargin, 100, frame.size.width - 2*leftMargin, 290);
    self = [super initWithFrame:panelFrame];
    if (self) {
        UIView *bkgrndView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        bkgrndView.backgroundColor = [LCHColorHelper lunchieLightGrey];
        bkgrndView.alpha = 0.8f;
        [self addSubview:bkgrndView];
//        UITapGestureRecognizer *tapRecognizer =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
//        [self addSubview:bkgrndView];
//        [bkgrndView addGestureRecognizer:tapRecognizer];
        
        UIView *headerBkgrnd = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
        headerBkgrnd.backgroundColor = [LCHColorHelper lunchieRed];
        [self addSubview:headerBkgrnd];
        
        UILabel *venueTitle = [[UILabel alloc] initWithFrame:headerBkgrnd.frame];
        venueTitle.text = venue.venueName;
        venueTitle.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall-3];
        venueTitle.textColor = [LCHColorHelper lunchieLightGrey];
        venueTitle.textAlignment = NSTextAlignmentCenter;
        [self addSubview:venueTitle];
        
        UIView *venueImageView = [[UIView alloc] initWithFrame:CGRectMake(0, headerBkgrnd.frame.size.height, self.frame.size.width, 150)];
        [venueImageView setBackgroundColor:[LCHColorHelper lunchiePurple]];
        venueImageView.clipsToBounds = YES;
        [self addSubview:venueImageView];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sauce"]];
        [venueImageView addSubview:imageView];
        

    }
    return self;
}
@end
