//
//  MSMenuCollectionViewCell.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 28.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSMenuCollectionViewCell.h"
#import "MSStyleSheet.h"

@interface MSMenuCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconView;

@end

@implementation MSMenuCollectionViewCell

#pragma mark - Setters

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setIconImage:(UIImage *)iconImage
{
    _iconImage = iconImage;
    self.iconView.image = iconImage;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected) {
        self.backgroundColor = self.highlightedColor;
        self.titleLabel.textColor = [UIColor whiteColor];
    }
    else {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.textColor = [[MSStyleSheet sharedInstance] darkTextColor];
    }
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];

    if (highlighted) {
        self.backgroundColor = self.highlightedColor;
        self.titleLabel.textColor = [UIColor whiteColor];
    }
    else {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.textColor = [[MSStyleSheet sharedInstance] darkTextColor];
    }
}


#pragma mark - UICollectionViewCell

- (void)awakeFromNib
{
    self.titleLabel.font = [[MSStyleSheet sharedInstance] defaultH2TextFont];
    self.titleLabel.textColor = [[MSStyleSheet sharedInstance] darkTextColor];
    self.backgroundColor = [UIColor whiteColor];
    
    self.iconView = [[UIImageView alloc] init];
    self.iconView.frame = CGRectMake(-30, 5, 60, 60);
    self.iconView.userInteractionEnabled = NO;
    [self addSubview:self.iconView];
}

@end
