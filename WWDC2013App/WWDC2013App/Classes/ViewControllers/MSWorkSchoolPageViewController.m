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
#import "MSAGHViewController.h"

@interface MSWorkSchoolPageViewController ()
<UIPageViewControllerDataSource>
@property (nonatomic, strong) NSArray *controllers;
@end

@implementation MSWorkSchoolPageViewController

- (id)initWithViewControllers:(NSArray *)vcs
{
    if (self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                        navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                      options:nil]) {
        self.controllers = vcs;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.dataSource = self;
    
    [self setViewControllers:@[self.controllers[0]]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];
}

#pragma mark - <UIPageViewCotrollerDataSource>

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger currentIndex = [self.controllers indexOfObject:viewController];
    if (currentIndex + 1 < [self.controllers count]) {
        return self.controllers[currentIndex+1];
    }
    else {
        return nil;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger currentIndex = [self.controllers indexOfObject:viewController];
    if (currentIndex - 1 >= 0) {
        return self.controllers[currentIndex-1];
    }
    else {
        return nil;
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.controllers count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
