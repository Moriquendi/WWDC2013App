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
#import <MediaPlayer/MediaPlayer.h>

NSString *const kImageCollectionViewCell = @"icv";
NSString *const kMovieCollectionViewCell = @"kMovie";

@interface MSProjectDetailsViewController ()
<UICollectionViewDataSource,
UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) MSProject *projectDetails;
@end

@implementation MSProjectDetailsViewController

#pragma mark - UIViewController

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
    [self.collectionView registerNib:[UINib nibWithNibName:@"MSMovieCollectionViewCell" bundle:nil]
          forCellWithReuseIdentifier:kMovieCollectionViewCell];

    self.collectionView.backgroundColor = [UIColor clearColor];

    [self.pageControl setNumberOfPages:[self.projectDetails.imageNames count]];

    if (self.projectDetails.movieName) {
        self.pageControl.numberOfPages++;

        NSUInteger dotIndex = [self.projectDetails.movieName rangeOfString:@"."].location;
        NSString *filePath = [[NSBundle mainBundle] pathForResource:[self.projectDetails.movieName substringToIndex:dotIndex] ofType:[self.projectDetails.movieName substringFromIndex:dotIndex+1]];
        NSURL *fileURL = [NSURL fileURLWithPath:filePath];
        self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.moviePlayerController stop];
}

#pragma mark - MSProjectDetailsViewController

- (id)initWithProjectDetails:(MSProject *)project
{
    if (self = [super init]) {
        self.projectDetails = project;
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.projectDetails.movieName) {
        return [self.projectDetails.imageNames count] + 1;
    }
    else {
        return [self.projectDetails.imageNames count];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && self.projectDetails.movieName) {
        UICollectionViewCell *movieCell = [collectionView dequeueReusableCellWithReuseIdentifier:kMovieCollectionViewCell forIndexPath:indexPath];
        return movieCell;
    }
    
    MSImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCollectionViewCell
                                                                                forIndexPath:indexPath];
    
    NSInteger isMovieCellVisible = self.projectDetails.movieName == nil ? 0 : 1;
    cell.image = [UIImage imageNamed:self.projectDetails.imageNames[[self.projectDetails.imageNames count] -1 - (indexPath.item-isMovieCellVisible)]];
    return cell;    
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    if ([[cell reuseIdentifier] isEqualToString:kMovieCollectionViewCell] && !self.moviePlayerController.view.superview) {
        // Movie controller
        self.moviePlayerController.view.frame = CGRectInset(cell.bounds, 20, 0);
        [cell addSubview:self.moviePlayerController.view];
        [self.moviePlayerController play];
    }
}

#pragma mark - <UICollectionViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.moviePlayerController) {
        [self.moviePlayerController pause];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = floor((scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width) + 1;
}

@end
