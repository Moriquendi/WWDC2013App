//
//  MSProjectCell.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSProjectCell.h"

@interface MSProjectCell ()
@property (weak, nonatomic) IBOutlet UILabel *projectNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *projectImageView;

@end

@implementation MSProjectCell

#pragma mark - Setters

- (void)setProjectName:(NSString *)projectName
{
    _projectName = projectName;
    self.projectNameLabel.text = projectName;
}

- (void)setProjectImage:(UIImage *)projectImage
{
    _projectImage = projectImage;
    self.projectImageView.image = projectImage;
}

#pragma mark - UITableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
