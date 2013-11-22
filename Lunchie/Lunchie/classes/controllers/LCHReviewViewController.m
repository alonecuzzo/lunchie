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

@interface LCHReviewViewController ()

@property(nonatomic) HPGrowingTextView *growingTextView;
@property(nonatomic) UIView *containerView;

@end

@implementation LCHReviewViewController

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillShow:)
													 name:UIKeyboardWillShowNotification
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillHide:)
													 name:UIKeyboardWillHideNotification
												   object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    float containerHeight = 40.0f;
    float buttonWidth = 40.0f;
    
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - containerHeight, self.view.frame.size.width, containerHeight)];
    _containerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_containerView];
    _containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    _growingTextView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(0, 3, _containerView.frame.size.width - buttonWidth, containerHeight)];
    _growingTextView.contentInset = UIEdgeInsetsMake(3, 3, 0, 0);
    _growingTextView.delegate = self;
    _growingTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [_containerView addSubview:_growingTextView];
    
    UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectMake(_growingTextView.frame.size.width + 5, 3, buttonWidth, 38)];
    [sendButton setTitle:@"send" forState:UIControlStateNormal];
    [sendButton setBackgroundColor:[UIColor blackColor]];
    [sendButton addTarget:self action:@selector(saveComment) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:sendButton];
}

- (void)saveComment
{
    NSLog(@"venueID: %@", self.venue.venueID);
    if ([_growingTextView.text length] > 0) {
        LCHStoredVenue *sv;
        if (!self.venue.storedVenue) {
            sv = [[LCHStoredVenue alloc] initWithDictionary:[NSDictionary dictionaryWithObject:self.venue.venueID forKey:kVenueIDKey]];
            [sv addComment:_growingTextView.text];
            [[LCHModel sharedInstance] writeStoredVenue:sv];
        } else {
            NSLog(@"our comments!, %d", self.venue.storedVenue.data.comments.count);
            [self.venue.storedVenue addComment:_growingTextView.text];
            [[LCHModel sharedInstance] writeStoredVenue:self.venue.storedVenue];
        }
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_growingTextView resignFirstResponder];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
