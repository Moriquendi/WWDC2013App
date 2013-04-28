//
//  MSProjectDetailsViewController.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 27.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSProjectDetailsViewController.h"
#import "MSImageCollectionViewCell.h"
#import "MSStyleSheet.h"

NSString *const kImageCollectionViewCell = @"icv";

@interface MSProjectDetailsViewController ()
<UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) MSProject *projectDetails;
@end

@implementation MSProjectDetailsViewController

#pragma mark - MSProjectDetailsViewController

- (id)initWithProjectDetails:(MSProject *)project
{
    if (self = [super init]) {
        self.projectDetails = project;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [[MSStyleSheet sharedInstance] defaultBackgroundColor];
    self.titleLabel.font = [[MSStyleSheet sharedInstance] defaultHeaderTextFont];
    self.description.font = [[MSStyleSheet sharedInstance] defaultTextFont];
    self.titleLabel.text = self.projectDetails.projectName;
    self.description.text = self.projectDetails.projectDescription;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MSImageCollectionViewCell" bundle:nil]
          forCellWithReuseIdentifier:kImageCollectionViewCell];
    self.collectionView.backgroundColor = [UIColor clearColor];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MSImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCollectionViewCell
                                                                                forIndexPath:indexPath];

    cell.image = [UIImage imageNamed:@"burglars-1"];
    
    return cell;
}


@end
