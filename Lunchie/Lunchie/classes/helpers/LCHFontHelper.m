//
//  LCHFontHelper.m
//  Lunchie
//
//  Created by Jabari on 11/23/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHFontHelper.h"

@implementation LCHFontHelper

+ (NSString*)getFontString:(LCHFont)font
{
    NSString *fontName;
    
    switch (font) {
        case LCHFontSullivanFill:
            fontName = @"Sullivan-Fill";
            break;
        
        case LCHFontSullivanRegular:
            fontName = @"Sullivan-Regular";
            break;
            
        case LCHFontSullivanBevel:
            fontName = @"Sullivan-Bevel";
            break;
    }
    
    return fontName;
}

+ (UIFont*)getFont:(LCHFont)font withSize:(LCHFontSize)size
{
    return [UIFont fontWithName:[self getFontString:font] size:size];
}

@end
