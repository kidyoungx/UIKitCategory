//
//  CALayer+CCCategory.h
//  CinCer
//
//  Created by Kid Young on 4/29/16.
//  Copyright © 2016 Yang XiHong. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class UIColor;

@interface CALayer (CCCategory)

@property (nonatomic, assign) UIColor *borderUIColor;

@end

@interface CALayer (Heart)

+ (CALayer *)heartLayerForSize:(CGSize)size;

@end
