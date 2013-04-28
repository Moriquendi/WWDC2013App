//
//  MSStyleSheet.h
//  WWDC2013App
//
//  Created by Michał Śmiałko on 27.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSStyleSheet : NSObject

/**
 Good tip - instancetype, more info here: nshipster.com/instancetype/
 */
+ (instancetype)sharedInstance;


// UIColors
- (UIColor *)defaultBackgroundColor;

// Fonts
- (UIFont *)defaultTextFont;
- (UIFont *)defaultBoldTextFont;
- (UIFont *)defaultHeaderTextFont;

// Fonts colors
- (UIColor *)darkTextColor;

@end
