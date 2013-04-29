//
//  MSMenuCollectionViewCell.h
//  WWDC2013App
//
//  Created by Michał Śmiałko on 28.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSMenuCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *iconImage;
@property (nonatomic, strong) UIColor *highlightedColor;

@end
