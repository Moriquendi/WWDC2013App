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

- (id)init
{
    if (self = [super init]) {
        [self _configureAppearanceProxies];
    }
    return self;
}

- (void)_configureAppearanceProxies
{
    // Navigation bar
    [[UINavigationBar appearance] setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor blackColor],
                        UITextAttributeTextShadowOffset : [NSValue valueWithCGPoint:CGPointMake(0, 0)],
                                    UITextAttributeFont : [UIFont fontWithName:@"Cochin-Bold" size:20.0]}];
    
    
    // Back buttons
    UIEdgeInsets backButImageInsets = UIEdgeInsetsMake(0, 15, 0, 6);
    UIImage *backButBgSelected = [[UIImage imageNamed:@"backButPressed"] resizableImageWithCapInsets:backButImageInsets];
    UIImage *backButBg = [[UIImage imageNamed:@"backBut"] resizableImageWithCapInsets:backButImageInsets];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButBg
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButBgSelected
                                                      forState:UIControlStateHighlighted
                                                    barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{UITextAttributeTextColor: [UIColor blackColor],
                         UITextAttributeTextShadowColor : [UIColor clearColor],
                                    UITextAttributeFont : [UIFont fontWithName:@"Cochin-Bold" size:11.0]}
                                                forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{UITextAttributeTextColor: [UIColor blackColor],
                         UITextAttributeTextShadowColor : [UIColor clearColor],
                                    UITextAttributeFont : [UIFont fontWithName:@"Cochin-Bold" size:11.0]}
                                                forState:UIControlStateHighlighted];
}

#pragma mark - Colors

- (UIColor *)defaultBackgroundColor
{
    return [UIColor colorWithRed:250.f/255.f
                           green:241.f/255.f
                            blue:232.f/255.f
                           alpha:1.0];
}

#pragma mark - Fonts

- (UIFont *)defaultTextFont
{
    return [UIFont fontWithName:@"Cochin" size:14.0];
}

- (UIFont *)defaultBoldTextFont
{
    return [UIFont fontWithName:@"Cochin-Bold" size:14.0];
}

- (UIFont *)defaultHeaderTextFont
{
    return [UIFont fontWithName:@"Cochin-Bold" size:20.0];
}

- (UIFont *)defaultH2TextFont
{
    return [UIFont fontWithName:@"Cochin-Bold" size:17.0];
}

#pragma mark - Fonts colors

- (UIColor *)darkTextColor
{
    return [UIColor blackColor];
}

- (UIColor *)lightTextColor
{
    return [UIColor whiteColor];
}

@end
