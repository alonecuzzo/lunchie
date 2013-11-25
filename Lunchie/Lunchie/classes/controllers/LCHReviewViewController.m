//
//  LCHReviewViewController.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHReviewViewController.h"
#import "LCHStoredVenue.h"
#import "LCHStoredVenueData.h"
#import "LCHModel.h"
#import "LCHColorHelper.h"
#import "LCHFontHelper.h"

@interface LCHReviewViewController ()

@property(nonatomic) HPGrowingTextView *growingTextView;
@property(nonatomic) UIView *containerView;
@property(nonatomic) NSArray *comments;
@property(nonatomic) UIView *navBar;

@end

@implementation LCHReviewViewController

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self refreshComments];
    
    _navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    _navBar.backgroundColor = [LCHColorHelper lunchieRed];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 27, [UIImage imageNamed:@"backButton"].size.width, [UIImage imageNamed:@"backButton"].size.height)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [_navBar addSubview:backButton];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, _navBar.frame.size.width, 20)];
    titleLabel.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"Reviews";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _navBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - _navBar.frame.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    float containerHeight = 50.0f;
    float buttonWidth = 90.0f;
    
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - containerHeight, self.view.frame.size.width, containerHeight)];
    _containerView.backgroundColor = [LCHColorHelper lunchieBlack];
    [self.view addSubview:_containerView];
    _containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    _growingTextView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(0, 9, _containerView.frame.size.width - buttonWidth, containerHeight)];
    _growingTextView.placeholder = @"Leave a Review";
    _growingTextView.contentInset = UIEdgeInsetsMake(7, 7, 0, 0);
    _growingTextView.delegate = self;
    _growingTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [_containerView addSubview:_growingTextView];
    
    UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectMake(_growingTextView.frame.size.width + 5, 0, buttonWidth - 5, containerHeight - 3)];
    [sendButton setTitle:@"Send" forState:UIControlStateNormal];
    [sendButton setBackgroundColor:[LCHColorHelper lunchieRed]];
    sendButton.titleLabel.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
    [sendButton addTarget:self action:@selector(saveComment) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:sendButton];
    
    [self.view addSubview:_navBar];
    [_navBar addSubview:titleLabel];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.topItem.title = @"Leave a Review";
}

- (void)backButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)refreshComments
{
    if (self.venue.storedVenue.data.comments) {
        _comments = self.venue.storedVenue.data.comments;
    }
}

- (void)saveComment
{
    if ([_growingTextView.text length] > 0) {
        LCHStoredVenue *sv;
        if (!self.venue.storedVenue) {
            sv = [[LCHStoredVenue alloc] initWithDictionary:[NSDictionary dictionaryWithObject:self.venue.venueID forKey:kVenueIDKey]];
            self.venue.storedVenue = sv;
            [sv addComment:_growingTextView.text];
            [[LCHModel sharedInstance] writeStoredVenue:sv];
        } else {
            [self.venue.storedVenue addComment:_growingTextView.text];
            [[LCHModel sharedInstance] writeStoredVenue:self.venue.storedVenue];
        }
        _growingTextView.text = @"";
        _growingTextView.placeholder = @"Leave a Review";
        [_growingTextView resignFirstResponder];
        [self refreshComments];
        [self.tableView reloadData];
    }
}

-(void) keyboardWillShow:(NSNotification *)note{
	CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
	CGRect containerFrame = _containerView.frame;
    containerFrame.origin.y = self.view.bounds.size.height - (keyboardBounds.size.height + containerFrame.size.height);
    
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
	
	_containerView.frame = containerFrame;
	
	[UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note{
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
	
	CGRect containerFrame = _containerView.frame;
    containerFrame.origin.y = self.view.bounds.size.height - containerFrame.size.height;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
	_containerView.frame = containerFrame;
	
	[UIView commitAnimations];
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    float diff = (growingTextView.frame.size.height - height);
    
	CGRect r = _containerView.frame;
    r.size.height -= diff;
    r.origin.y += diff;
	_containerView.frame = r;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (_comments) ? _comments.count : 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_growingTextView resignFirstResponder];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
        cell.textLabel.textColor = [LCHColorHelper lunchieBlack];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [_comments objectAtIndex:indexPath.row];
    
    return cell;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
