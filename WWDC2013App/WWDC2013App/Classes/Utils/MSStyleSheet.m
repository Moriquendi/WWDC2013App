//
//  MSStyleSheet.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 27.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSStyleSheet.h"

@implementation MSStyleSheet

#pragma mark - + MSStyleSheet

+ (instancetype)sharedInstance
{
    static MSStyleSheet *_instance = nil;
    static dispatch_once_t pred;
    dispatch_once(&(pred), ^{
        _instance = [[MSStyleSheet alloc] init];
    });
    return _instance;
}

#pragma mark - MSStyleSheet

- (UIColor *)defaultBackgroundColor
{
    return [UIColor colorWithWhite:240.f/255.f alpha:1.0];
}

@end
