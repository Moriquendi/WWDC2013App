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

CGFloat const kProjectCellHeight = 215;
NSString *const kProjectCellIdentifier = @"kProjectCell";

@interface MSProjectsViewController ()
<UITableViewDataSource,
UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *projects;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MSProjectsViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    #warning probably move somewhere else
    // Model
    self.projects = [[NSMutableArray alloc] init];
    // Farm 2 iOS Project
    MSProject *farmProject = [[MSProject alloc] init];
    farmProject.title = @"Farm 2";
    [self.projects addObject:farmProject];

    // Self config
    self.view.backgroundColor = [[MSStyleSheet sharedInstance] defaultBackgroundColor];;

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
    MSProjectCell *projectCell = [tableView dequeueReusableCellWithIdentifier:kProjectCellIdentifier];
    projectCell.projectImage = [UIImage imageNamed:@"Farm2-1"];
    return projectCell;
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kProjectCellHeight;
}

@end
