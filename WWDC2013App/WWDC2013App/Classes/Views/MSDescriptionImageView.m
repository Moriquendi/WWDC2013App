//
//  MSDescriptionImageView.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 29.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSDescriptionImageView.h"

@interface MSDescriptionImageView ()

@property (nonatomic) NSInteger currentImageIndex;

@property (nonatomic, strong) UIImageView *frontView;
@property (nonatomic, strong) UIImageView *backView;

@end

@implementation MSDescriptionImageView

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *view in self.imagesViews) {
        view.frame = self.bounds;
    }
}

#pragma mark - MSDescriptionImageView

- (void)startAnimation
{
    self.currentImageIndex = 0;
    [self fadeAction];
    [NSTimer scheduledTimerWithTimeInterval:6.2 target:self selector:@selector(fadeAction) userInfo:nil repeats:YES];
}

- (void)setImagesViews:(NSArray *)imagesViews
{
    _imagesViews = imagesViews;
    _frontView = imagesViews[0];
    for (UIView *view in imagesViews) {
        view.frame = self.bounds;
    }
    [self addSubview:_frontView];
}

- (void)performTransition:(UIViewAnimationOptions)options
{
    UIView *fromView, *toView;
    
    fromView = self.frontView;
    toView = self.backView;
    
    self.backView.alpha = 0.0;
    [self addSubview:self.backView];
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
        self.frontView.alpha = 0.0;
        self.backView.alpha = 1.0;
    } completion:^(BOOL finished) {
        [self.frontView removeFromSuperview];
        self.frontView = self.backView;
    }];
}

- (void)fadeAction
{
    // Set new images
    if (self.currentImageIndex + 1 < [self.imagesViews count]) {
        self.currentImageIndex++;
    }
    else {
        self.currentImageIndex = 0;
    }
    self.backView = self.imagesViews[self.currentImageIndex];
    self.backView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self performTransition:UIViewAnimationOptionTransitionCrossDissolve];
}

@end
