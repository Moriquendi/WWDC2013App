//
//  MSBaseViewController.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 30.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSBaseViewController.h"
#import "MSStyleSheet.h"
#import <MediaPlayer/MediaPlayer.h>
#import <QuartzCore/QuartzCore.h>

@interface MSBaseViewController ()
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIView *descriptionBgView;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;

@end

@implementation MSBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIView *bgView = [[MSStyleSheet sharedInstance] defaultBackgroundView];
    bgView.frame = self.view.bounds;
    [self.view insertSubview:bgView atIndex:0];

    // Header
    [[MSStyleSheet sharedInstance] restyleBordersAndShadows:self.headerView];
    self.headerLabel.font = [[MSStyleSheet sharedInstance] defaultHeaderTextFont];
    self.headerView.layer.borderWidth = 0.0;
    
    // Description
    self.descriptionLabel.font = [[MSStyleSheet sharedInstance] defaultTextFont];
    [[MSStyleSheet sharedInstance] restyleBordersAndShadows:self.descriptionBgView];
    
    // Movie controller
    [[MSStyleSheet sharedInstance] restyleBordersAndShadows:self.videoView];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"hackKRK" ofType:@"mp4"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    [self.videoView addSubview:self.moviePlayerController.view];
    self.moviePlayerController.view.frame = self.videoView.bounds;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.moviePlayerController play];
}

@end
