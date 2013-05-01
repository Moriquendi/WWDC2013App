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
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *cellViews;
@property (nonatomic) BOOL videoPlayed;
@property (weak, nonatomic) IBOutlet UIView *descriptionView;
@end

@implementation MSCocoaHeadsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Learn & Teach", nil);
    self.view.backgroundColor = [UIColor clearColor];

    // Movie controller
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cocoaHeadsKrk" ofType:@"m4v"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    [self.videoView addSubview:self.moviePlayerController.view];
    self.moviePlayerController.view.frame = self.videoView.bounds;
    self.videoPlayed = NO;
    
    // Views
    for (UIView *view in self.cellViews) {
        [[MSStyleSheet sharedInstance] restyleBordersAndShadows:view];
    }
    
    CGAffineTransform cellTransform = CGAffineTransformTranslate(self.descriptionView.transform, 0, self.view.frame.size.height*1.5);
    cellTransform = CGAffineTransformRotate(cellTransform, M_PI_4);
    self.descriptionView.transform = cellTransform;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
        [UIView animateWithDuration:0.6 animations:^{
            self.descriptionView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            if (!self.videoPlayed) {
                [self.moviePlayerController performSelector:@selector(play) withObject:nil afterDelay:0.1];
                self.videoPlayed = YES;
            }
        }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.moviePlayerController pause];
}


@end
