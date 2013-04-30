//
//  MSWorkSchoolPageViewController.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 30.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSWorkSchoolPageViewController.h"
#import "MSBaseViewController.h"
#import "MSStyleSheet.h"

@interface MSWorkSchoolPageViewController ()
@property (nonatomic, strong) NSArray *controllers;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation MSWorkSchoolPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Work & School";

    self.controllers = @[[[MSBaseViewController alloc] init]];
    [self setViewControllers:self.controllers
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];
    
    // Page Control
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - MS_THUMB_SIZE, self.view.frame.size.width, MS_THUMB_SIZE)];
    self.pageControl.numberOfPages = [self.controllers count];
    self.pageControl.currentPage = 0;
    [self.view addSubview:self.pageControl];
}

@end
