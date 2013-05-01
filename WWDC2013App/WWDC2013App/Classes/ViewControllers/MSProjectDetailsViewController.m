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

@interface MSProjectDetailsViewController ()
<UICollectionViewDataSource,
UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;

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
    self.collectionView.backgroundColor = [UIColor clearColor];
}

#pragma mark - MSProjectDetailsViewController

- (id)initWithProjectDetails:(MSProject *)project
{
    if (self = [super init]) {
        self.projectDetails = project;
    }
    return self;
}

- (void)movieFinished:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:self.moviePlayerController];
    [self.moviePlayerController.view removeFromSuperview];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.projectDetails.imageNames count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MSImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCollectionViewCell
                                                                                forIndexPath:indexPath];

    cell.image = [UIImage imageNamed:self.projectDetails.imageNames[[self.projectDetails.imageNames count] - indexPath.item -1]];
    
    return cell;    
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Movie controller
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"KaratePandaTrailer" ofType:@"mp4"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    [self.view addSubview:self.moviePlayerController.view];
    self.moviePlayerController.fullscreen = YES;
    [self.moviePlayerController play];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieFinished:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.moviePlayerController];
    
}

@end
