//
//  MSStyleSheet.h
//  WWDC2013App
//
//  Created by Michał Śmiałko on 27.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MS_THUMB_SIZE   44.0f

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
- (UIFont *)defaultH2TextFont;

// Fonts colors
- (UIColor *)darkTextColor;
- (UIColor *)lightTextColor;

@end
