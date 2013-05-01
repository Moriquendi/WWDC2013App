//
//  MSConferencesViewController.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 30.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSConferencesViewController.h"
#import "MSStyleSheet.h"

@interface MSConferencesViewController ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *cellViews;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *confCells;

@end

@implementation MSConferencesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor clearColor];
    for (UIView *view in self.cellViews) {
        [[MSStyleSheet sharedInstance] restyleBordersAndShadows:view];
    }
}

@end
