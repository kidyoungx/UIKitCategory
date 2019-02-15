//
//  UIFont+CCCategory.m
//  SmartOWON
//
//  Created by Kid Young on 6/19/14.
//  Copyright (c) 2014 Yang XiHong. All rights reserved.
//

#import "UIFont+CCCategory.h"
#import "NSObject+CCCategory.h"

@implementation UIFont (CCCategory)

+ (void)load
{
    [super load];
//    [self overrideClassMethod:@selector(systemFontOfSize:) withClassMethod:@selector(defaultFontOfSize:) error:nil];
//    [self overrideClassMethod:@selector(boldSystemFontOfSize:) withClassMethod:@selector(defaultFontOfSize:) error:nil];
//    [self overrideClassMethod:@selector(italicSystemFontOfSize:) withClassMethod:@selector(defaultFontOfSize:) error:nil];
//    [self swizzleClassMethod:@selector(systemFontOfSize:) withClassMethod:@selector(defaultFontOfSize:) error:nil];
//    [self swizzleClassMethod:@selector(boldSystemFontOfSize:) withClassMethod:@selector(defaultFontOfSize:) error:nil];
//    [self swizzleClassMethod:@selector(italicSystemFontOfSize:) withClassMethod:@selector(defaultFontOfSize:) error:nil];
}

+ (UIFont *)defaultFontOfSize:(CGFloat)fontSize
{
    UIFont *font = [UIFont fontWithName:@"KelsonSans-Regular" size:fontSize];
    return font;
}

@end
