//
//  MSProjectCell.h
//  WWDC2013App
//
//  Created by Michał Śmiałko on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSTimelineView.h"

@interface MSProjectCell : UITableViewCell

@property (nonatomic, strong) NSString *projectName;
@property (nonatomic, strong) UIImage *projectImage;
@property (nonatomic, weak) IBOutlet MSTimelineView *timelineView;

@end
