//
//  MSImageCollectionViewCell.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 28.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSImageCollectionViewCell.h"

@interface MSImageCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

@end

@implementation MSImageCollectionViewCell

#pragma mark - Setters

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.cellImageView.image = image;
}

@end
