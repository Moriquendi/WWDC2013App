//
//  MSCocoaHeadsViewController.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 30.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSCocoaHeadsViewController.h"
#import "MSStyleSheet.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MSCocoaHeadsViewController ()
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;
@property (weak, nonatomic) IBOutlet UIView *quoteView;
@end

@implementation MSCocoaHeadsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Learn & Teach", nil);
    self.view.backgroundColor = [UIColor clearColor];

    // Movie controller
    [[MSStyleSheet sharedInstance] restyleBordersAndShadows:self.videoView];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cocoaHeadsKrk" ofType:@"m4v"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    [self.videoView addSubview:self.moviePlayerController.view];
    self.moviePlayerController.view.frame = self.videoView.bounds;
    self.moviePlayerController.initialPlaybackTime = 0.5;
    [self.moviePlayerController play];
    [self.moviePlayerController stop];
    
    // Views
    [[MSStyleSheet sharedInstance] restyleBordersAndShadows:self.quoteView];
}


@end
