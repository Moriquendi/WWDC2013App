//
//  MSDescriptionImageView.h
//  WWDC2013App
//
//  Created by Michał Śmiałko on 29.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSDescriptionImageView : UIScrollView

@property (nonatomic, strong) NSArray *imagesViews;

- (void)startAnimation;

@end
