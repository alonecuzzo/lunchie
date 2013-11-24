//
//  LCHFontHelper.h
//  Lunchie
//
//  Created by Jabari on 11/23/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    LCHFontSullivanFill,
    LCHFontSullivanRegular,
    LCHFontSullivanBevel
};
typedef NSInteger LCHFont;

enum {
    LCHFontSizeSmall                  = 24,
    LCHFontSizeCityNameLarge          = 40
};
typedef NSInteger LCHFontSize;

@interface LCHFontHelper : NSObject

+ (UIFont*)getFont:(LCHFont)font withSize:(LCHFontSize)size;
+ (NSString*)getFontString:(LCHFont)font;

@end
