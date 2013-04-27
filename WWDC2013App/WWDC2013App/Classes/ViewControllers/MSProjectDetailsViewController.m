//
//  MSProjectDetailsViewController.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 27.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSProjectDetailsViewController.h"

@interface MSProjectDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) MSProject *projectDetails;
@end

@implementation MSProjectDetailsViewController

- (id)initWithProjectDetails:(MSProject *)project
{
    if (self = [super init]) {
        self.projectDetails = project;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleLabel.text = self.projectDetails.projectName;
    self.description.text = self.projectDetails.projectDescription;
    self.imageView.image = [UIImage imageNamed:[self.projectDetails.imageNames lastObject]];
}

@end
