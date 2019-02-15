//
//  UIView+CCCategory.m
//  CCFrameworks
//
//  Created by Kid Young on 8/30/12.
//  Copyright (c) 2012 Yang XiHong. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIView+CCCategory.h"

@implementation UIView (CCCategory)

@end

#pragma mark - IBDesignable

IB_DESIGNABLE
@implementation UIView (IBDesignable)

- (void)setMasksToBounds:(BOOL)masksToBounds
{
    self.layer.masksToBounds = masksToBounds;
}

- (BOOL)masksToBounds
{
    return self.layer.masksToBounds;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderUIColor
{
    self.layer.borderColor = borderUIColor.CGColor;
}

- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

@end

#pragma mark - Screenshot

@implementation UIView (CCImageOfRectangle)

- (UIImage *)imageOfRectangle:(CGRect)rect opaque:(BOOL)opaque {
    CGFloat scaleFactor = UIScreen.mainScreen.scale;
    rect = CGRectIntegral(rect);
    CGFloat width = rect.origin.x + rect.size.width;
    CGFloat height = rect.origin.y + rect.size.height;
    width = width - (int)width % 2;
    height = height - (int)height % 2;
    CGRect imageFrame = CGRectMake(rect.origin.x * scaleFactor,
                                   rect.origin.y * scaleFactor,
                                   width * scaleFactor,
                                   height * scaleFactor);
    UIImage *contextImage;
    UIGraphicsBeginImageContextWithOptions(imageFrame.size,
                                           opaque,
                                           scaleFactor);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:contextRef];
    contextImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    rect = CGRectMake(rect.origin.x * scaleFactor,
                      rect.origin.y * scaleFactor,
                      rect.size.width * scaleFactor,
                      rect.size.height * scaleFactor);
    CGImageRef imageRef = CGImageCreateWithImageInRect(contextImage.CGImage,
                                                       rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef
                                         scale:scaleFactor
                                   orientation:UIImageOrientationUp];
    CGImageRelease(imageRef);
    return image;
}

@end

@implementation UIView (CCAnimation)

#pragma mark - setCenter Animation

- (void)setCenter:(CGPoint)center 
         duration:(NSTimeInterval)duration 
            delay:(NSTimeInterval)delay 
            curve:(UIViewAnimationCurve)curve {
    [UIView beginAnimations:@"SetCenter" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationDelay:delay];
    [UIView setAnimationCurve:curve];
    [self setCenter:center];
    [UIView commitAnimations];
}

- (void)setCenter:(CGPoint)center 
         duration:(NSTimeInterval)duration 
            curve:(UIViewAnimationCurve)curve {
    [UIView beginAnimations:@"SetCenter" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [self setCenter:center];
    [UIView commitAnimations];
}

- (void)setCenter:(CGPoint)center 
         duration:(NSTimeInterval)duration 
         delegate:(id)delegate 
     stopSelector:(SEL)selector {
    [UIView beginAnimations:@"SetCenter" context:nil];
    [UIView setAnimationDelegate:delegate];
    [UIView setAnimationDidStopSelector:selector];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:duration];
    [self setCenter:center];
    [UIView commitAnimations];
}

- (void)setCenter:(CGPoint)center 
         duration:(NSTimeInterval)duration {
    [UIView beginAnimations:@"SetCenter" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:duration];
    [self setCenter:center];
    [UIView commitAnimations];
}

#pragma mark - setFrame Animation

- (void)setFrame:(CGRect)frame
        duration:(NSTimeInterval)duration
           delay:(NSTimeInterval)delay
           curve:(UIViewAnimationCurve)curve {
    [UIView beginAnimations:@"SetFrame" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationDelay:delay];
    [UIView setAnimationCurve:curve];
    [self setFrame:frame];
    [UIView commitAnimations];
}

- (void)setFrame:(CGRect)frame
        duration:(NSTimeInterval)duration
           curve:(UIViewAnimationCurve)curve {
    [UIView beginAnimations:@"SetFrame" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [self setFrame:frame];
    [UIView commitAnimations];
}

- (void)setFrame:(CGRect)frame 
        duration:(NSTimeInterval)duration 
        delegate:(id)delegate 
    stopSelector:(SEL)selector {
    [UIView beginAnimations:@"SetFrame" context:nil];
    [UIView setAnimationDelegate:delegate];
    [UIView setAnimationDidStopSelector:selector];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:duration];
    [self setFrame:frame];
    [UIView commitAnimations];
}

- (void)setFrame:(CGRect)frame 
        duration:(NSTimeInterval)duration {
    [UIView beginAnimations:@"SetFrame" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:duration];
    [self setFrame:frame];
    [UIView commitAnimations];
}

#pragma mark - setHidden Animation

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated {
    if (animated) {
        CAKeyframeAnimation *keyframeAnimation = 
        [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        keyframeAnimation.delegate = id<CAAnimationDelegate>self;
        keyframeAnimation.removedOnCompletion = NO;
        NSMutableArray *mutableArray = [NSMutableArray array];
        NSValue *value;
        CATransform3D transform;
        if (hidden) {
            keyframeAnimation.fillMode = kCAFillModeForwards;
            keyframeAnimation.duration = 0.25;
            transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
            value = [NSValue valueWithCATransform3D:transform];
            [mutableArray addObject:value];
            transform = CATransform3DMakeScale(0.5, 0.5, 0.5);
            value = [NSValue valueWithCATransform3D:transform];
            [mutableArray addObject:value];
            transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
            value = [NSValue valueWithCATransform3D:transform];
            [mutableArray addObject:value];
        } else {
            [self setHidden:hidden];
            keyframeAnimation.fillMode = kCAFillModeBoth;
            keyframeAnimation.duration = 0.35;
            transform = CATransform3DMakeScale(0.1, 0.1, 1.0);
            value = [NSValue valueWithCATransform3D:transform];
            [mutableArray addObject:value];
            transform = CATransform3DMakeScale(1.2, 1.2, 1.0);
            value = [NSValue valueWithCATransform3D:transform];
            [mutableArray addObject:value];
            transform = CATransform3DMakeScale(0.9, 0.9, 0.9);
            value = [NSValue valueWithCATransform3D:transform];
            [mutableArray addObject:value];
            transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
            value = [NSValue valueWithCATransform3D:transform];
            [mutableArray addObject:value];
        }
        keyframeAnimation.values = mutableArray;
        [self.layer removeAnimationForKey:@"SetHidden"];
        [self.layer addAnimation:keyframeAnimation forKey:@"SetHidden"];
    } else {
        [self setHidden:hidden];
    }
}

#pragma mark - setTransform Animation

- (void)setTransform:(CGAffineTransform)transform 
            duration:(NSTimeInterval)duration 
               delay:(NSTimeInterval)delay 
               curve:(UIViewAnimationCurve)curve {
    [UIView beginAnimations:@"SetTransform" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationDelay:delay];
    [UIView setAnimationCurve:curve];
    [self setTransform:transform];
    [UIView commitAnimations];
}

- (void)setTransform:(CGAffineTransform)transform 
            duration:(NSTimeInterval)duration 
               curve:(UIViewAnimationCurve)curve {
    [UIView beginAnimations:@"SetTransform" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [self setTransform:transform];
    [UIView commitAnimations];
}

- (void)setTransform:(CGAffineTransform)transform 
               curve:(UIViewAnimationCurve)curve {
    [UIView beginAnimations:@"SetTransform" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationCurve:curve];
    [self setTransform:transform];
    [UIView commitAnimations];
}

- (void)setTransform:(CGAffineTransform)transform 
    fromCurrentState:(BOOL)fromCurrentState {
    [UIView beginAnimations:@"SetTransform" context:nil];
    [UIView setAnimationBeginsFromCurrentState:fromCurrentState];
    [self setTransform:transform];
    [UIView commitAnimations];
}

#pragma mark - setTransformMakeRotation

- (void)setTransformMakeRotationRadians:(CGFloat)radian {
    [UIView beginAnimations:@"setTransformMakeRotation" context:nil];
    [self setTransform:CGAffineTransformMakeRotation(radian)];
    [UIView commitAnimations];
}

- (void)setTransformMakeRotationDegrees:(CGFloat)degree {
    CGFloat radian = degree * M_PI / 180;
    [self setTransformMakeRotationRadians:radian];
}

#pragma mark - setTransformRotate

- (void)setTransformRotate:(CGAffineTransform)t radians:(CGFloat)radian {
    [UIView beginAnimations:@"setTransformRotate" context:nil];
    [self setTransform:CGAffineTransformRotate(t, radian)];
    [UIView commitAnimations];
}

- (void)setTransformRotate:(CGAffineTransform)t degrees:(CGFloat)degree {
    CGFloat radian = degree * M_PI / 180;
    [self setTransformRotate:t radians:radian];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CAKeyframeAnimation *animation = (CAKeyframeAnimation *)anim;
    if ([animation.fillMode isEqualToString:@"forwards"]) {
        [self setHidden:flag];
//    } else if ([animation.fillMode isEqualToString:@"both"]) {
    }
}

@end
