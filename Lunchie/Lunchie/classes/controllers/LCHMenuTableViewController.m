//
//  LCHMenuTableViewController.m
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHMenuTableViewController.h"
#import "LCHNetworkManager.h"
#import "LCHMenu.h"
#import "LCHMenuSection.h"
#import "LCHMenuEntry.h"
#import "LCHModel.h"
#import "LCHColorHelper.h"
#import "LCHFontHelper.h"

@interface LCHMenuTableViewController ()

@property(nonatomic)LCHNetworkManager *manager;
@property(nonatomic)LCHMenu *menu;
@property(nonatomic) UIView *navBar;

@end

@implementation LCHMenuTableViewController

- (id)init
{
    self = [super init];
    if (self) {
        [[LCHModel sharedInstance] setCurrentMenu:nil];
        _manager = [[LCHNetworkManager alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    _navBar.backgroundColor = [LCHColorHelper lunchieRed];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, [UIImage imageNamed:@"backButton"].size.width, [UIImage imageNamed:@"backButton"].size.height)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [_navBar addSubview:backButton];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, _navBar.frame.size.width, 20)];
    titleLabel.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"Menu";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _navBar.frame.size.height - 25, self.view.frame.size.width, self.view.frame.size.height - _navBar.frame.size.height + 25)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    _manager.menuDelegate = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [_manager searchMenusForVenueID:self.venueID];
    });
    
    [self.view addSubview:_navBar];
    [_navBar addSubview:titleLabel];
}

- (void)refreshMenu
{
    _menu = [[LCHModel sharedInstance] currentMenu];
    NSLog(@"menu section count:: %d", _menu.menuSections.count);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ([self hasMenu]) ? [self.menu.menuSections count] : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ([self hasMenu]) ? [[(LCHMenuSection*)[self.menu.menuSections objectAtIndex:section] entries] count] : 0;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if ([self hasMenu]) {
        LCHMenuSection *menuSection = [self.menu.menuSections objectAtIndex:section];
        return menuSection.sectionName;
    }
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
        cell.textLabel.textColor = [LCHColorHelper lunchieBlack];
    }
    
    LCHMenuSection *menuSection = [_menu.menuSections objectAtIndex:indexPath.section];
    LCHMenuEntry *menuEntry = [menuSection.entries objectAtIndex:indexPath.row];
    cell.textLabel.text = menuEntry.entryName;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, 45)];
    sectionLabel.backgroundColor = [LCHColorHelper lunchieBlack];
    sectionLabel.textColor = [UIColor whiteColor];
    sectionLabel.font = [LCHFontHelper getFont:LCHFontSullivanFill withSize:LCHFontSizeSmall];
    LCHMenuSection *menuSection = [self.menu.menuSections objectAtIndex:section];
    sectionLabel.text = menuSection.sectionName;
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 45)];
    sectionHeaderView.backgroundColor = [LCHColorHelper lunchieBlack];
    [sectionHeaderView addSubview:sectionLabel];
    return sectionHeaderView;
}

- (BOOL)hasMenu
{
    return self.menu.menuSections.count > 0;
}

@end
