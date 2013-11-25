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
#import "LCHSocialMediaButton.h"

@interface LCHVenuePanel()

@property(nonatomic) LCHFoursquareVenue *venue;
@property(nonatomic) UIView *headerBkgrnd;
@property(nonatomic) UILabel *venueTitleLabel;
@property(nonatomic) UIView *bkgrndView;
@property(nonatomic) UIView *venueImageView;
@property(nonatomic) UIView *heartView;
@property(nonatomic) UILabel *addressLabel;
@property(nonatomic) UIButton *thumbsDownButton;
@property(nonatomic) LCHSocialMediaButton *menuButton;
@property(nonatomic) LCHSocialMediaButton *reviewsButton;
@property(nonatomic) LCHSocialMediaButton *sendToFriendsButton;
@property(nonatomic) UIButton *backButton;
@property(nonatomic) UIGestureRecognizer *tapRecognizer;

@end

@implementation LCHVenuePanel {
    CGRect _parentFrame;
    CGRect _originalFrame;
    CGRect _originalHeaderBkgrndFrame;
    CGRect _originalTitleFrame;
    CGRect _originalVenueImageFrame;
    CGRect _originalHeartViewFrame;
    CGRect _originalAddressFrame;
    CGRect _originalBkgrndViewFrame;
}

- (instancetype)initWithVenue:(LCHFoursquareVenue*)venue andParentFrame:(CGRect)frame andImageName:(NSString*)imageName
{
    self.venue = venue;
    
    float leftMargin = 40;
    float innerLeftMargin = 10;
    
    _parentFrame = frame;
    
    _originalFrame = CGRectMake(leftMargin, 130, frame.size.width - 2 * leftMargin, 230);
    self = [super initWithFrame:_originalFrame];
    if (self) {
        _bkgrndView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _bkgrndView.backgroundColor = [UIColor whiteColor];
        _bkgrndView.alpha = 0.8f;
        [self addSubview:_bkgrndView];
        _tapRecognizer =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(venuePanelWasTapped:)];
        [self addGestureRecognizer:_tapRecognizer];
        _originalBkgrndViewFrame = _bkgrndView.frame;
        
        _headerBkgrnd = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
        _headerBkgrnd.backgroundColor = [LCHColorHelper lunchieRed];
        [self addSubview:_headerBkgrnd];
        _originalHeaderBkgrndFrame = _headerBkgrnd.frame;
        
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 28, [UIImage imageNamed:@"backButton"].size.width, [UIImage imageNamed:@"backButton"].size.height)];
        [_backButton setBackgroundImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [_headerBkgrnd addSubview:_backButton];
        _backButton.alpha = 0;
        
        _venueTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(innerLeftMargin, 0, self.frame.size.width - 2 * innerLeftMargin, _headerBkgrnd.frame.size.height)];
        _venueTitleLabel.text = venue.venueName;
        _venueTitleLabel.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall-3];
        _venueTitleLabel.textColor = [UIColor whiteColor];
        _venueTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_venueTitleLabel];
        _originalTitleFrame = _venueTitleLabel.frame;
        
        _venueImageView = [[UIView alloc] initWithFrame:CGRectMake(0, _headerBkgrnd.frame.size.height, self.frame.size.width, 150)];
        [_venueImageView setBackgroundColor:[LCHColorHelper lunchiePurple]];
        _venueImageView.clipsToBounds = YES;
        [self addSubview:_venueImageView];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        [_venueImageView addSubview:imageView];
        _originalVenueImageFrame = _venueImageView.frame;
        
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
        _originalHeartViewFrame = _heartView.frame;
        
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(_heartView.frame.origin.x + _heartView.frame.size.width, _heartView.frame.origin.y, self.frame.size.width - (_heartView.frame.origin.x + _heartView.frame.size.width) - innerLeftMargin, 30)];
        _addressLabel.font = likeCount.font;
        _addressLabel.textColor = [LCHColorHelper lunchiePurple];
        _addressLabel.textAlignment = NSTextAlignmentRight;
        _addressLabel.text = venue.venueAddress;
        [self addSubview:_addressLabel];
        _originalAddressFrame = _addressLabel.frame;
        
        _thumbsDownButton = [[UIButton alloc] initWithFrame:CGRectMake(_heartView.frame.origin.x + 265, _heartView.frame.origin.y - 140, [UIImage imageNamed:@"thumbsDownIconNormal"].size.width + 10, [UIImage imageNamed:@"thumbsDownIconNormal"].size.height + 10)];
        [_thumbsDownButton addTarget:self action:@selector(thumbsDownButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [_thumbsDownButton setImage:[UIImage imageNamed:@"thumbsDownIconNormal"] forState:UIControlStateNormal];
        [_thumbsDownButton setImage:[UIImage imageNamed:@"thumbsDownIconSelected"] forState:UIControlStateSelected];
        _thumbsDownButton.alpha = 0;
        
        _reviewsButton = [[LCHSocialMediaButton alloc] initWithFrame:CGRectMake(innerLeftMargin, _heartView.frame.origin.y + _heartView.frame.size.height + 90, _parentFrame.size.width - 2 * innerLeftMargin, 45)];
        [_reviewsButton addTarget:self action:@selector(reviewsWasTapped) forControlEvents:UIControlEventTouchUpInside];
        _reviewsButton.alpha = 0;
        [self refreshReviewButton];
        [_reviewsButton setBackgroundColor:[LCHColorHelper lunchiePurple]];
        
        _menuButton = [[LCHSocialMediaButton alloc] initWithFrame:CGRectMake(_reviewsButton.frame.origin.x, _reviewsButton.frame.origin.y + _reviewsButton.frame.size.height + 10, _reviewsButton.frame.size.width, 45)];
        [_menuButton addTarget:self action:@selector(menuWasTapped) forControlEvents:UIControlEventTouchUpInside];
        _menuButton.alpha = 0;
        [_menuButton setTitle:@"Menu" forState:UIControlStateNormal];
        [_menuButton setBackgroundColor:[LCHColorHelper lunchiePurple]];
        
        _sendToFriendsButton = [[LCHSocialMediaButton alloc] initWithFrame:CGRectMake(_menuButton.frame.origin.x, _menuButton.frame.origin.y + _menuButton.frame.size.height + 10, _menuButton.frame.size.width, 45)];
        [_sendToFriendsButton addTarget:self action:@selector(sendToTeamWasTapped) forControlEvents:UIControlEventTouchUpInside];
        _sendToFriendsButton.alpha = 0;
        [_sendToFriendsButton setTitle:@"Send To Team" forState:UIControlStateNormal];
        [_sendToFriendsButton setBackgroundColor:[LCHColorHelper lunchieRed]];
        
        if (self.venue.storedVenue)
            _thumbsDownButton.selected = self.venue.storedVenue.data.isThumbsDowned;
    }
    return self;
}

- (void)refreshReviewButton
{
    NSString *reviewsString = (self.venue.storedVenue && self.venue.storedVenue.data.comments.count > 0) ? [NSString stringWithFormat:@"Reviews(%lu)", (unsigned long)self.venue.storedVenue.data.comments.count] : @"Reviews(0)";
    [_reviewsButton setTitle:reviewsString forState:UIControlStateNormal];
}

- (void)thumbsDownButtonPressed
{
    _thumbsDownButton.selected = !_thumbsDownButton.selected;
    [self.venueDelegate thumbsDownWasTapped:self.venue isThumbsDown:_thumbsDownButton.selected];
}

- (void)venuePanelWasTapped:(UIGestureRecognizer*)tapGestureRecognizer
{
    [self removeGestureRecognizer:tapGestureRecognizer];
    [self.venueDelegate venuePanelWasTapped:self];
}

- (void)reviewsWasTapped
{
    [self.venueDelegate reviewsWasTapped:self.venue];
}

- (void)menuWasTapped
{
    [self.venueDelegate menuWasTapped:self.venue];
}

- (void)sendToTeamWasTapped
{
    [self.venueDelegate sendToTeamWasTapped:self.venue];
}

- (void)backButtonPressed
{
    [self.venueDelegate backButtonwasTapped:self];
}

- (void)openPanel
{
    [self addSubview:_thumbsDownButton];
    [self addSubview:_reviewsButton];
    [self addSubview:_sendToFriendsButton];
    [self addSubview:_menuButton];
    _backButton.hidden = NO;
    [UIView animateWithDuration:0.3f animations:^{
        [self setFrame:self.superview.frame];
        [_bkgrndView setBackgroundColor:[UIColor whiteColor]];
        [_headerBkgrnd setFrame:CGRectMake(0, 0, self.superview.frame.size.width, 60)];
        [_venueTitleLabel setFrame:CGRectMake(((self.superview.frame.size.width / 2) - (_venueTitleLabel.frame.size.width / 2)), 20, _venueTitleLabel.frame.size.width, _venueTitleLabel.frame.size.height)];
        [_bkgrndView setFrame:CGRectMake(0, 0, self.superview.frame.size.width, self.superview.frame.size.height)];
        [_venueImageView setFrame:CGRectMake(0, _headerBkgrnd.frame.size.height, self.superview.frame.size.width, _venueImageView.frame.size.height + 40)];
        [_heartView setFrame:CGRectMake(20, _venueImageView.frame.size.height + 75, _heartView.frame.size.width, _heartView.frame.size.height)];
        [_addressLabel setFrame:CGRectMake(self.superview.frame.size.width - _addressLabel.frame.size.width - 20, _venueImageView.frame.size.height + 75, _addressLabel.frame.size.width, _addressLabel.frame.size.height)];
    } completion:^(BOOL finished) {
         [_reviewsButton setFrame:CGRectMake(_reviewsButton.frame.origin.x, _reviewsButton.frame.origin.y, _reviewsButton.frame.size.width, _reviewsButton.frame.size.height)];
         [_menuButton setFrame:CGRectMake(_menuButton.frame.origin.x, _menuButton.frame.origin.y, _menuButton.frame.size.width, _menuButton.frame.size.height)];
         [_sendToFriendsButton setFrame:CGRectMake(_sendToFriendsButton.frame.origin.x, _sendToFriendsButton.frame.origin.y, _sendToFriendsButton.frame.size.width, _sendToFriendsButton.frame.size.height)];
        [UIView animateWithDuration:0.3f animations:^{
            _menuButton.alpha = 1.0f;
            _sendToFriendsButton.alpha = 1.0f;
            _thumbsDownButton.alpha = 1.0f;
            _reviewsButton.alpha = 1.0f;
            _backButton.alpha = 1.0f;
        } completion:^(BOOL finished) {
            [self.venueDelegate panelDidFinishOpening];
        }];
    }];
}

- (void)closePanel
{
    [UIView animateWithDuration:0.0f animations:^{
        _backButton.alpha = 0;
        _reviewsButton.alpha = 0;
        _menuButton.alpha = 0;
        _sendToFriendsButton.alpha = 0;
        _thumbsDownButton.alpha = 0;
    } completion:^(BOOL finished) {
        _backButton.hidden = YES;
        [_reviewsButton removeFromSuperview];
        [_menuButton removeFromSuperview];
        [_sendToFriendsButton removeFromSuperview];
        [_thumbsDownButton removeFromSuperview];
        [UIView animateWithDuration:0.3f animations:^{
            [self setFrame:_originalFrame];
            [_headerBkgrnd setFrame:_originalHeaderBkgrndFrame];
            [_bkgrndView setFrame:_originalBkgrndViewFrame];
            [_venueTitleLabel setFrame:_originalTitleFrame];
            [_venueImageView setFrame:_originalVenueImageFrame];
            [_heartView setFrame:_originalHeartViewFrame];
            [_addressLabel setFrame:_originalAddressFrame];
        } completion:^(BOOL finished) {
            [self.venueDelegate panelDidFinishClosing:self];
            [self addGestureRecognizer:_tapRecognizer];
        }];
    }];
}

@end
