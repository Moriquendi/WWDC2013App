//
//  MSAGHViewController.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 30.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSAGHViewController.h"
#import "MSDescriptionImageView.h"
#import "MSStyleSheet.h"

@interface MSAGHViewController ()
@property (weak, nonatomic) IBOutlet MSDescriptionImageView *imagesGroupView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *descriptionView;

@end

@implementation MSAGHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    // Restyle cells
    [[MSStyleSheet sharedInstance] restyleBordersAndShadows:self.headerView];
    [[MSStyleSheet sharedInstance] restyleBordersAndShadows:self.descriptionView];
    [[MSStyleSheet sharedInstance] restyleBordersAndShadows:self.imagesGroupView];

    // Load images
    UIImageView *view1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"insideAGH"]];
    UIImageView *view2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aghfront"]];
    UIImageView *view3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aghnoc"]];
    self.imagesGroupView.imagesViews = @[view1, view2, view3];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.imagesGroupView startAnimation];
}

@end
