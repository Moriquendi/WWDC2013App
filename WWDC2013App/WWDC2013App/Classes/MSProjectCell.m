//
//  MSProjectCell.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSProjectCell.h"
#import "MSStyleSheet.h"
#import <QuartzCore/QuartzCore.h>

@interface MSProjectCell ()
@property (weak, nonatomic) IBOutlet UILabel *projectNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *projectImageView;
@property (weak, nonatomic) IBOutlet UIView *contentBgView;

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

- (void)awakeFromNib
{
    // Background
//    UIImage *bgImage = [[UIImage imageNamed:@"projectBg"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
//    self.contentBgView.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    self.contentBgView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
    
    // Fonts
    self.projectNameLabel.font = [[MSStyleSheet sharedInstance] defaultH2TextFont];
    self.projectNameLabel.textColor = [[MSStyleSheet sharedInstance] lightTextColor];

    self.projectImageView.layer.borderWidth = 2;
    self.projectImageView.layer.borderColor = [[UIColor colorWithRed:146.f/255.f
                                                               green:138.f/255.f
                                                                blue:127.f/255.f
                                                               alpha:1.0] CGColor];
    self.projectImageView.layer.cornerRadius = 4.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
