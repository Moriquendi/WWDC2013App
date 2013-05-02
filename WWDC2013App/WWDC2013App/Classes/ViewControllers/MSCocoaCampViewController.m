//
//  MSCocoaCampViewController.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 01.05.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSCocoaCampViewController.h"
#import "MSStyleSheet.h"

@interface MSCocoaCampViewController ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *cellViews;

@end

@implementation MSCocoaCampViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (UIView *view in self.cellViews) {
        [[MSStyleSheet sharedInstance] restyleBordersAndShadows:view];
    }
}

@end
