//
//  MSTimelineView.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 27.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSTimelineView.h"

CGFloat const circleRadius = 7;

@implementation MSTimelineView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
}

#pragma mark - UIView

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    // Draw half of vertical line
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor greenColor] CGColor]);
    CGContextMoveToPoint(context, self.bounds.size.width/2.f, 0);
    CGContextAddLineToPoint(context, self.bounds.size.width/2.f, self.bounds.size.height/2.f - circleRadius);
    CGContextStrokePath(context);

    // Draw circle
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.bounds.size.width/2.f - circleRadius,
                                                                           self.bounds.size.height/2.f - circleRadius,
                                                                           circleRadius*2,
                                                                           circleRadius*2)];
    [circlePath stroke];

    // Draw second half of vertical line
    CGContextMoveToPoint(context, self.bounds.size.width/2.f, self.bounds.size.height/2.f + circleRadius);
    CGContextAddLineToPoint(context, self.bounds.size.width/2.f, self.bounds.size.height);
    CGContextStrokePath(context);
}

@end
