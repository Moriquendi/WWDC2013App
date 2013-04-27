//
//  MSViewController.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSViewController.h"
#import "UIView+Animations.h"

#import <QuartzCore/QuartzCore.h>

@interface MSViewController ()

@end

@implementation MSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    /*
    void (^wait)(void (^completion)(void)) = ^(void (^completion)(void)){
        
        
        if (completion) {
            completion();
        }
    };
    wait(nil);
    */
    
    
    
    // Who Am I Label
    UILabel *whoAmILabel = [[UILabel alloc] init];
    whoAmILabel.backgroundColor = [UIColor clearColor];
    whoAmILabel.text = @"Who am I?";
    whoAmILabel.font = [UIFont boldSystemFontOfSize:20];
    whoAmILabel.textColor = [UIColor whiteColor];
    [whoAmILabel sizeToFit];
    whoAmILabel.alpha = 0.0;
    [self.view addSubview:whoAmILabel];
    /*
    UILabel *questionMark  = [[UILabel alloc] init];
    questionMark.text = @"?";
    questionMark.textColor = [UIColor whiteColor];
    questionMark.backgroundColor = [UIColor clearColor];
    questionMark.font = [UIFont boldSystemFontOfSize:20];
    [questionMark sizeToFit];
    [self.view addSubview:questionMark];
    */
    whoAmILabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:whoAmILabel
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0
                                                                constant:0];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:whoAmILabel
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1.0
                                                                constant:0];
    /*
    NSLayoutConstraint *quesionAlignLeft = [NSLayoutConstraint constraintWithItem:questionMark
                                                                        attribute:NSLayoutAttributeLeft
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:whoAmILabel
                                                                        attribute:NSLayoutAttributeRight
                                                                       multiplier:1.0
                                                                         constant:0.0];

    NSLayoutConstraint *quesionAlignVertical = [NSLayoutConstraint constraintWithItem:questionMark
                                                                            attribute:NSLayoutAttributeCenterY
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.view
                                                                            attribute:NSLayoutAttributeCenterY
                                                                           multiplier:1.0
                                                                             constant:0.0];
    */
    
    
    
    [self.view addConstraint:centerX];
    [self.view addConstraint:centerY];
    /*
    [self.view addConstraint:quesionAlignLeft];
    [self.view addConstraint:quesionAlignVertical];
    */
    
    
    
    [whoAmILabel fadeInDuration:0.4 delay:0.0];
    [whoAmILabel fadeOutDuration:0.4 delay:2.0];
    
    

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
