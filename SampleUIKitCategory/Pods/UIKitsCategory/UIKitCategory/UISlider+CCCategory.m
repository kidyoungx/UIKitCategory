//
//  UISlider+CCCategory.m
//  CinCer
//
//  Created by Kid Young on 6/22/17.
//  Copyright © 2017 Yang XiHong. All rights reserved.
//

#import "UISlider+CCCategory.h"

@implementation UISlider (CCCategory)

- (void)setThumbImage:(UIImage *)image
{
    [self setThumbImage:image forState:UIControlStateNormal];
    [self setThumbImage:image forState:UIControlStateHighlighted];
}

- (void)setThumbImageName:(NSString *)name
{
    [self setThumbImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [self setThumbImage:[UIImage imageNamed:name] forState:UIControlStateHighlighted];
}

@end
