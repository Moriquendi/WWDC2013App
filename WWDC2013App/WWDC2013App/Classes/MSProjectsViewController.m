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

CGFloat const kProjectCellHeight = 200;
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
    self.view.backgroundColor = [[MSStyleSheet sharedInstance] defaultBackgroundColor];;
    self.title = @"Projects timeline";

    // Table view
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"MSProjectCell" bundle:nil]
         forCellReuseIdentifier:kProjectCellIdentifier];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    MSProjectDetailsViewController *projectDetailsVC = [[MSProjectDetailsViewController alloc] init];
    [self presentSemiViewController:projectDetailsVC];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray *centerCellsIndexPaths = [self.tableView indexPathsForRowsInRect:CGRectMake(0, scrollView.contentOffset.y + self.tableView.bounds.size.height/2.f,
                                                                                       self.tableView.bounds.size.width, 1)];
    
    self.highlightedCell.timelineView.highlighted = NO;
    
    if ([centerCellsIndexPaths count] >= 1) {
        MSProjectCell *cell = (MSProjectCell *)[self.tableView cellForRowAtIndexPath:centerCellsIndexPaths[0]];
        self.highlightedCell = cell;
        cell.timelineView.highlighted = YES;
    }
    
}

@end
