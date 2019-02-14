//
//  UIColor+CCCategory.m
//  CCFrameworks
//
//  Created by Kid Young on 8/30/12.
//  Copyright (c) 2012 Yang XiHong. All rights reserved.
//

#import "UIColor+CCCategory.h"

@implementation UIColor (CCCategory)

@end

@implementation UIColor (CCCompare)

- (BOOL)isEqualToColor:(UIColor *)color {
    return CGColorEqualToColor(self.CGColor, color.CGColor);
}

@end

@implementation UIColor (CCGenerate)

+ (UIColor *)colorWithUCharRed:(unsigned char)red green:(unsigned char)green blue:(unsigned char)blue alpha:(unsigned char)alpha {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha / 255.0];
}

@end
