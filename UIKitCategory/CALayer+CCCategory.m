//
//  CALayer+CCCategory.m
//  CinCer
//
//  Created by Kid Young on 4/29/16.
//  Copyright © 2016 Yang XiHong. All rights reserved.
//

#import "CALayer+CCCategory.h"

#import <UIKit/UIColor.h>
#import <UIKit/UIBezierPath.h>

@implementation CALayer (CCCategory)

- (void)setBorderUIColor:(UIColor *)borderUIColor
{
    self.borderColor = borderUIColor.CGColor;
}

- (UIColor *)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end

@implementation CALayer (Heart)

+ (CALayer *)heartLayerForSize:(CGSize)size
{
    CAShapeLayer *shapeLayer = CAShapeLayer.layer;
    CGFloat width = size.width;
    CGFloat height = size.height;
    CGFloat segment = height / 16;
    UIBezierPath *bezierPathRight = UIBezierPath.bezierPath;
    [bezierPathRight moveToPoint:CGPointMake(width / 2, height / 4 - segment)];
    [bezierPathRight addCurveToPoint:CGPointMake(width / 2, height / 4 + segment * 12) controlPoint1:CGPointMake(width / 2 + segment * 3, height / 4 - segment * 8) controlPoint2:CGPointMake(width / 2 + segment * 16, height / 4 + segment * 2)];
    [bezierPathRight closePath];
    UIBezierPath *bezierPathLeft = UIBezierPath.bezierPath;
    [bezierPathLeft moveToPoint:CGPointMake(width / 2, height / 4 + segment * 12)];
    [bezierPathLeft addCurveToPoint:CGPointMake(width / 2, height / 4 - segment) controlPoint1:CGPointMake(width / 2 - segment * 16, height / 4 + segment * 2) controlPoint2:CGPointMake(width / 2 - segment * 3, height / 4 - segment * 8)];
    [bezierPathLeft closePath];
    [bezierPathRight appendPath:bezierPathLeft];
    shapeLayer.path = bezierPathRight.CGPath;
    return shapeLayer;
}

@end
