//
//  MSProjectsViewController.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSProjectsViewController.h"
#import "MSProject.h"
#import "MSProjectCell.h"
#import "MSStyleSheet.h"
#import "UIViewController+KNSemiModal.h"
#import "MSProjectDetailsViewController.h"

CGFloat const kProjectCellHeight = 228;
NSString *const kProjectCellIdentifier = @"kProjectCell";

@interface MSProjectsViewController ()
<UITableViewDataSource,
UITableViewDelegate>

@property (nonatomic, strong) NSArray *projects;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) MSProjectCell *highlightedCell;

@end

@implementation MSProjectsViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Load model
    self.projects = [MSProject loadProjectsFromFile:@"projectsList"];

    // Self config
    // Use bgView instead of background color. BGColors causes problems in semi modal views. To be fixed.
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgView.image = [UIImage imageNamed:@"bgmenu"];
    [self.view insertSubview:bgView atIndex:0];
    self.title = @"Projects";

    // Table view
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"MSProjectCell" bundle:nil]
         forCellReuseIdentifier:kProjectCellIdentifier];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(self.navigationController.navigationBar.frame.size.height, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(self.navigationController.navigationBar.frame.size.height, 0, 0, 0);
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.tableView.frame = CGRectMake(0, 0,
                                      self.view.frame.size.width,
                                      self.view.frame.size.height);
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.projects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MSProject *project = self.projects[indexPath.row];
    MSProjectCell *projectCell = [tableView dequeueReusableCellWithIdentifier:kProjectCellIdentifier];

    projectCell.projectImage = [UIImage imageNamed:project.imageNames[0]];
    projectCell.projectName = project.projectName;
    return projectCell;
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kProjectCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MSProjectDetailsViewController *projectDetailsVC = [[MSProjectDetailsViewController alloc] initWithProjectDetails:self.projects[indexPath.row]];
    [self presentSemiViewController:projectDetailsVC];
}

@end
