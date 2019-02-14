//
//  UITabBar+CCCategory.m
//  CinCer
//
//  Created by Kid Young on 1/17/18.
//  Copyright © 2018 Yang XiHong. All rights reserved.
//

#import "UITabBar+CCCategory.h"

@implementation UITabBar (CCCategory)

- (void)setTransparent:(BOOL)transparent
{
    if (transparent == YES) {
        self.backgroundImage = [UIImage new];
        self.shadowImage = [UIImage new];
        self.translucent = YES;
    } else {
        self.backgroundImage = nil;
        self.shadowImage = nil;
    }
}

- (BOOL)isTransparent
{
    return self.isTranslucent && self.backgroundImage && CGSizeEqualToSize(self.backgroundImage.size, CGSizeZero) && self.shadowImage && CGSizeEqualToSize(self.shadowImage.size, CGSizeZero);
}

@end
