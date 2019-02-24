//
//  UIView+CCCategory.h
//  CCFrameworks
//
//  Created by Kid Young on 8/30/12.
//  Copyright (c) 2012 Yang XiHong. All rights reserved.
//

// QuartzCore.framework
// UIScreen+CCCategory.h

#import <UIKit/UIKit.h>

@interface UIView (CCCategory)

@end

#pragma mark - IBDesignableUIViews

@interface IBDesignableUILabel : UILabel
@end

@interface IBDesignableUIButton : UIButton
@end

@interface IBDesignableUITextField : UITextField
@end

@interface IBDesignableUISlider : UISlider
@end

@interface IBDesignableUITableView : UITableView
@end

@interface IBDesignableUITableViewCell : UITableViewCell
@end

@interface IBDesignableUIImageView : UIImageView
@end

@interface IBDesignableUICollectionView : UICollectionView
@end

@interface IBDesignableUICollectionViewCell : UICollectionViewCell
@end

@interface IBDesignableUITextView : UITextView
@end

@interface IBDesignableUIScrollView : UIScrollView
@end

@interface IBDesignableUIView : UIView
@end

#pragma mark - IBDesignable

@interface UIView (IBDesignable)

@property (nonatomic, assign) IBInspectable BOOL masksToBounds;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, weak, nullable) IBInspectable UIColor *borderColor;

@end

#pragma mark - Screenshot

@interface UIView (CCImageOfRectangle)

- (UIImage *)imageOfRectangle:(CGRect)rect opaque:(BOOL)opaque;

@end

@interface UIView (CCAnimation)

#pragma mark - setCenter Animation

- (void)setCenter:(CGPoint)center
         duration:(NSTimeInterval)duration
            delay:(NSTimeInterval)delay
            curve:(UIViewAnimationCurve)curve;

- (void)setCenter:(CGPoint)center
         duration:(NSTimeInterval)duration
            curve:(UIViewAnimationCurve)curve;

- (void)setCenter:(CGPoint)center
         duration:(NSTimeInterval)duration
         delegate:(id)delegate 
     stopSelector:(SEL)selector;

- (void)setCenter:(CGPoint)center
         duration:(NSTimeInterval)duration;

#pragma mark - setFrame Animation

- (void)setFrame:(CGRect)frame
        duration:(NSTimeInterval)duration
           delay:(NSTimeInterval)delay
           curve:(UIViewAnimationCurve)curve;

- (void)setFrame:(CGRect)frame
        duration:(NSTimeInterval)duration
           curve:(UIViewAnimationCurve)curve;

- (void)setFrame:(CGRect)frame
        duration:(NSTimeInterval)duration 
        delegate:(id)delegate 
    stopSelector:(SEL)selector;

- (void)setFrame:(CGRect)frame
        duration:(NSTimeInterval)duration;

#pragma mark - setHidden Animation

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated;

#pragma mark - setTransform Animation

- (void)setTransform:(CGAffineTransform)transform 
            duration:(NSTimeInterval)duration 
               delay:(NSTimeInterval)delay 
               curve:(UIViewAnimationCurve)curve;

- (void)setTransform:(CGAffineTransform)transform 
            duration:(NSTimeInterval)duration 
               curve:(UIViewAnimationCurve)curve;

- (void)setTransform:(CGAffineTransform)transform 
               curve:(UIViewAnimationCurve)curve;

- (void)setTransform:(CGAffineTransform)transform 
    fromCurrentState:(BOOL)fromCurrentState;

#pragma mark - setTransformMakeRotation

- (void)setTransformMakeRotationRadians:(CGFloat)radian;

- (void)setTransformMakeRotationDegrees:(CGFloat)degree;

#pragma mark - setTransformRotate

- (void)setTransformRotate:(CGAffineTransform)t radians:(CGFloat)radian;

- (void)setTransformRotate:(CGAffineTransform)t degrees:(CGFloat)degree;

@end
