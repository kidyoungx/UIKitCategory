//
//  UIColor+CCCategory.h
//  CCFrameworks
//
//  Created by Kid Young on 8/30/12.
//  Copyright (c) 2012 Yang XiHong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CCCategory)

@end

@interface UIColor (CCCompare)

- (BOOL)isEqualToColor:(UIColor *)color;

@end

@interface UIColor (CCGenerate)

+ (UIColor *)colorWithUCharRed:(unsigned char)red green:(unsigned char)green blue:(unsigned char)blue alpha:(unsigned char)alpha;

@end
