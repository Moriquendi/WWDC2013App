//
//  MSWorkSchoolViewController.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 29.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSWorkSchoolViewController.h"
#import "MSDescriptionImageView.h"

@interface MSWorkSchoolViewController ()
<UICollectionViewDataSource>

@end

@implementation MSWorkSchoolViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    MSDescriptionImageView *imageView = [[MSDescriptionImageView alloc] initWithFrame:self.view.bounds];
    UIImageView *view1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"insideAGH"]];
    UIImageView *view2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aghfront"]];
    UIImageView *view3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aghnoc"]];
    imageView.imagesViews = @[view1, view2, view3];
    [self.view addSubview:imageView];

    self.view.backgroundColor = [UIColor blackColor];
    
    [imageView startAnimation];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
