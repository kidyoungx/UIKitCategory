//
//  UIImage+CCCategory.h
//  CCFrameworks
//
//  Created by Kid Young on 8/29/13.
//  Copyright (c) 2013 Yang XiHong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Size)

- (UIImage *)imageByScaleToSize:(CGSize)size;
- (UIImage *)imageByResizeToSize:(CGSize)size;

/**
 Creates and returns a new image object with the specified size.

 @param size The logical dimensions of the image, measured in points.
 @param contentMode Currently support only UIViewContentModeTop and UIViewContentModeBottom
 @return A new image object with the specified size.

 */
- (UIImage *)imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

@end

@interface UIImage (Transformation)

- (UIImage *)imageByGaussianBlur;

- (UIImage *)blurImageWithPoint:(NSUInteger)point;

- (UIImage *)gaussianBlurImage;

- (UIImage *)grayImage;
- (UIImage *)grayscaleImage;

@end

@interface UIImage (Generation)

+ (UIImage *)imageFromUIColor:(UIColor *)color;
+ (UIImage *)imageFromUIColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageFromColorWithRed:(CGFloat)red greed:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

@end
