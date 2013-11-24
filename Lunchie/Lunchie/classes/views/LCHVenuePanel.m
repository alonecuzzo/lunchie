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
@property(nonatomic) UIView *headerBkgrnd;
@property(nonatomic) UILabel *venueTitleLabel;
@property(nonatomic) UIView *bkgrndView;
@property(nonatomic) UIView *venueImageView;
@property(nonatomic) UIView *heartView;
@property(nonatomic) UILabel *addressLabel;

@end

@implementation LCHVenuePanel {
    CGRect _parentFrame;
}

- (instancetype)initWithVenue:(LCHFoursquareVenue*)venue andParentFrame:(CGRect)frame
{
    float leftMargin = 40;
    float innerLeftMargin = 10;
    
    _parentFrame = frame;
    
    CGRect panelFrame = CGRectMake(leftMargin, 130, frame.size.width - 2 * leftMargin, 230);
    self = [super initWithFrame:panelFrame];
    if (self) {
        _bkgrndView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _bkgrndView.backgroundColor = [LCHColorHelper lunchieLightGrey];
        _bkgrndView.alpha = 0.8f;
        [self addSubview:_bkgrndView];
        UITapGestureRecognizer *tapRecognizer =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(venuePanelWasTapped:)];
        [self addGestureRecognizer:tapRecognizer];
        
        _headerBkgrnd = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
        _headerBkgrnd.backgroundColor = [LCHColorHelper lunchieRed];
        [self addSubview:_headerBkgrnd];
        
        _venueTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(innerLeftMargin, 0, self.frame.size.width - 2 * innerLeftMargin, _headerBkgrnd.frame.size.height)];
        _venueTitleLabel.text = venue.venueName;
        _venueTitleLabel.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall-3];
        _venueTitleLabel.textColor = [UIColor whiteColor];
        _venueTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_venueTitleLabel];
        
        _venueImageView = [[UIView alloc] initWithFrame:CGRectMake(0, _headerBkgrnd.frame.size.height, self.frame.size.width, 150)];
        [_venueImageView setBackgroundColor:[LCHColorHelper lunchiePurple]];
        _venueImageView.clipsToBounds = YES;
        [self addSubview:_venueImageView];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sauce"]];
        [_venueImageView addSubview:imageView];
        
        UIImageView *heartImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heart"]];
        [heartImageView setFrame:CGRectMake(0, 0, [UIImage imageNamed:@"heart"].size.width, [UIImage imageNamed:@"heart"].size.height)];
        UILabel *likeCount = [[UILabel alloc] initWithFrame:CGRectMake(heartImageView.frame.size.width + heartImageView.frame.origin.x + 2, heartImageView.frame.origin.y - 2, 50, 30)];
        likeCount.text = [NSString stringWithFormat:@"%d", venue.venueLikes];
        likeCount.textColor = [LCHColorHelper lunchiePurple];
        likeCount.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
        _heartView = [[UIView alloc] initWithFrame:CGRectMake(innerLeftMargin, _venueImageView.frame.size.height + 5 + _venueImageView.frame.origin.y, heartImageView.frame.size.width + likeCount.frame.size.width, [UIImage imageNamed:@"heart"].size.height)];
        [self addSubview:_heartView];
        [_heartView addSubview:likeCount];
        [_heartView addSubview:heartImageView];
        
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(_heartView.frame.origin.x + _heartView.frame.size.width, _heartView.frame.origin.y, self.frame.size.width - (_heartView.frame.origin.x + _heartView.frame.size.width) - innerLeftMargin, 30)];
        _addressLabel.font = likeCount.font;
        _addressLabel.textColor = [LCHColorHelper lunchiePurple];
        _addressLabel.textAlignment = NSTextAlignmentRight;
        _addressLabel.text = venue.venueAddress;
        [self addSubview:_addressLabel];
        
    }
    return self;
}

- (void)venuePanelWasTapped:(UIGestureRecognizer*)tapGestureRecognizer
{
    [self removeGestureRecognizer:tapGestureRecognizer];
    [self.venueDelegate venuePanelWasTapped:self];
}

- (void)openPanel
{
    [UIView animateWithDuration:0.5f animations:^{
        CGPoint headerPoint = [self convertPoint:CGPointMake(0, 0) fromView:self.superview];
        [_headerBkgrnd setFrame:CGRectMake(headerPoint.x, headerPoint.y, self.superview.frame.size.width, 60)];
        [_venueTitleLabel setFrame:CGRectMake(headerPoint.x + ((self.superview.frame.size.width / 2) - (_venueTitleLabel.frame.size.width / 2)), headerPoint.y + 20, _venueTitleLabel.frame.size.width, _venueTitleLabel.frame.size.height)];
        [_bkgrndView setFrame:CGRectMake(headerPoint.x, headerPoint.y, self.superview.frame.size.width, self.superview.frame.size.height)];
        [_venueImageView setFrame:CGRectMake(headerPoint.x, headerPoint.y + 60, self.superview.frame.size.width, _venueImageView.frame.size.height + 40)];
        [_heartView setFrame:CGRectMake(headerPoint.x + 20, headerPoint.y + _venueImageView.frame.size.height + 75, _heartView.frame.size.width, _heartView.frame.size.height)];
        [_addressLabel setFrame:CGRectMake(headerPoint.x + self.superview.frame.size.width - _addressLabel.frame.size.width - 20, headerPoint.y + _venueImageView.frame.size.height + 75, _addressLabel.frame.size.width, _addressLabel.frame.size.height)];
    } completion:^(BOOL finished) {
        
    }];
}

@end
