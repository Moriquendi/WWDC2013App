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
    [self addSubview:_frontView];
}

- (void)performTransition:(UIViewAnimationOptions)options
{
    UIView *fromView, *toView;
    
    fromView = self.frontView;
    toView = self.backView;
    
    self.backView.alpha = 0.0;
    [self addSubview:self.backView];
    self.backView.frame = CGRectMake(0,
                                     0,//self.frame.size.height - self.backView.frame.size.height/2.f,
                                     self.frame.size.width,//self.backView.frame.size.width,
                                     self.frame.size.height-self.frame.origin.y);
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
        self.frontView.alpha = 0.0;
        self.backView.alpha = 1.0;
        self.backView.frame = CGRectOffset(self.backView.frame, -(self.backView.frame.size.width - self.frame.size.width)/2., 0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3.0
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            self.backView.frame = CGRectOffset(self.backView.frame, -(self.backView.frame.size.width - self.frame.size.width)/2., 0);
        } completion:nil];
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
    self.backView.contentMode = UIViewContentModeScaleAspectFit;// UIViewContentModeScaleAspectFill;
    
    [self performTransition:UIViewAnimationOptionTransitionCrossDissolve];
}

@end
