//
//  UINavigationBar+CCCategory.m
//  CinCer
//
//  Created by Kid Young on 1/17/18.
//  Copyright © 2018 Yang XiHong. All rights reserved.
//

#import "UINavigationBar+CCCategory.h"

@implementation UINavigationBar (CCCategory)

- (void)setTransparent:(BOOL)transparent
{
    if (transparent == YES) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.shadowImage = [UIImage new];
        self.translucent = YES;
    } else {
        [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        self.shadowImage = nil;
    }
}

- (BOOL)isTransparent
{
    UIImage *backgroundImage = [self backgroundImageForBarMetrics:UIBarMetricsDefault];
    return self.isTranslucent && backgroundImage && CGSizeEqualToSize(backgroundImage.size, CGSizeZero) && self.shadowImage && CGSizeEqualToSize(self.shadowImage.size, CGSizeZero);
}

@end
