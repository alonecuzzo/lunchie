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
    float innerLeftMargin = 10;
    
    CGRect panelFrame = CGRectMake(leftMargin, 130, frame.size.width - 2 * leftMargin, 230);
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
        
        UILabel *venueTitle = [[UILabel alloc] initWithFrame:CGRectMake(innerLeftMargin, 0, self.frame.size.width - 2 * innerLeftMargin, headerBkgrnd.frame.size.height)];
        venueTitle.text = venue.venueName;
        venueTitle.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall-3];
        venueTitle.textColor = [UIColor whiteColor];
        venueTitle.textAlignment = NSTextAlignmentCenter;
        [self addSubview:venueTitle];
        
        UIView *venueImageView = [[UIView alloc] initWithFrame:CGRectMake(0, headerBkgrnd.frame.size.height, self.frame.size.width, 150)];
        [venueImageView setBackgroundColor:[LCHColorHelper lunchiePurple]];
        venueImageView.clipsToBounds = YES;
        [self addSubview:venueImageView];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sauce"]];
        [venueImageView addSubview:imageView];
        
        UIImageView *heartImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heart"]];
        [heartImageView setFrame:CGRectMake(innerLeftMargin, venueImageView.frame.size.height + 5 + venueImageView.frame.origin.y, [UIImage imageNamed:@"heart"].size.width, [UIImage imageNamed:@"heart"].size.height)];
        [self addSubview:heartImageView];
        
        UILabel *likeCount = [[UILabel alloc] initWithFrame:CGRectMake(heartImageView.frame.size.width + heartImageView.frame.origin.x + 2, heartImageView.frame.origin.y - 2, 50, 30)];
        likeCount.text = [NSString stringWithFormat:@"%d", venue.venueLikes];
        likeCount.textColor = [LCHColorHelper lunchiePurple];
        likeCount.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
        [self addSubview:likeCount];
        
        UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(likeCount.frame.origin.x + likeCount.frame.size.width, likeCount.frame.origin.y, self.frame.size.width - (likeCount.frame.origin.x + likeCount.frame.size.width) - innerLeftMargin, 30)];
        addressLabel.font = likeCount.font;
        addressLabel.textColor = [LCHColorHelper lunchiePurple];
        addressLabel.textAlignment = NSTextAlignmentRight;
        addressLabel.text = venue.venueAddress;
        [self addSubview:addressLabel];
        
    }
    return self;
}
@end
