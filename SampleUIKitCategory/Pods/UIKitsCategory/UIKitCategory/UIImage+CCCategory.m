//
//  UIImage+CCCategory.m
//  CCFrameworks
//
//  Created by Kid Young on 8/29/13.
//  Copyright (c) 2013 Yang XiHong. All rights reserved.
//

#import "UIImage+CCCategory.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (Size)

- (UIImage *)imageByScaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}

- (UIImage *)imageByResizeToSize:(CGSize)size
{
    return [self imageByResizeToSize:size contentMode:UIViewContentModeBottom];
}

- (UIImage *)imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    switch (contentMode) {
        case UIViewContentModeTop:
            [self drawInRect:CGRectMake((size.width - self.size.width) / 2, 0, size.width,  self.size.height)];
            break;

        case UIViewContentModeBottom:
            [self drawInRect:CGRectMake((size.width - self.size.width) / 2, (size.height - self.size.height), size.width,  self.size.height)];
            break;

        default:
            break;
    }
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}

@end

@implementation UIImage (Transformation)

- (UIImage *)imageByGaussianBlur
{
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
//    [gaussianBlurFilter setDefaults];
    CIImage *inputImage = [CIImage imageWithCGImage:self.CGImage];
//    CIImage *inputImage = [[CIImage alloc] initWithImage:self];
    [gaussianBlurFilter setValue:inputImage forKey:kCIInputImageKey];
    [gaussianBlurFilter setValue:@10 forKey:kCIInputRadiusKey];

    CIImage *outputImage = gaussianBlurFilter.outputImage;
//    CIImage *outputImage = [gaussianBlurFilter valueForKey:kCIOutputImageKey];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:outputImage fromRect:outputImage.extent];
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return image;
}

- (UIImage *)blurImageWithPoint:(NSUInteger)point
{
    int32_t index = point * 2 * self.scale + 1;
    int16_t kernel[index];
    for (NSInteger i = 0; i < index; i++) {
        kernel[i] = 1;
    }

    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self drawAtPoint:CGPointZero];

    size_t width = CGBitmapContextGetWidth(ctx);
    size_t height = CGBitmapContextGetHeight(ctx);
    size_t bytesPerRow = CGBitmapContextGetBytesPerRow(ctx);

    UInt8 *data = CGBitmapContextGetData(ctx);

    vImage_Buffer src = {data, height, width, bytesPerRow};

    vImageConvolve_ARGB8888(&src, &src, NULL, 0, 0, kernel , index, 1, index, NULL, kvImageEdgeExtend);
    vImageConvolve_ARGB8888(&src, &src, NULL, 0, 0, kernel, 1, index, index, NULL, kvImageEdgeExtend);

    UIImage *blurImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return blurImage;
}

static int16_t gaussianblur_kernel[13] = {
    1, 12, 66, 220, 495, 792, 924, 792, 495, 220, 66, 12, 1
};

- (UIImage *)gaussianBlurImage
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self drawAtPoint:CGPointZero];

    size_t width = CGBitmapContextGetWidth(ctx);
    size_t height = CGBitmapContextGetHeight(ctx);
//    size_t bitsPerComponent = CGBitmapContextGetBitsPerComponent(ctx);
//    size_t bitsPerPixcel = CGBitmapContextGetBitsPerPixel(ctx);
    size_t bytesPerRow = CGBitmapContextGetBytesPerRow(ctx);

    UInt8 *data = CGBitmapContextGetData(ctx);

    vImage_Buffer src = {data, height, width, bytesPerRow};

    vImageConvolve_ARGB8888(&src, &src, NULL, 0, 0, gaussianblur_kernel, 13, 1, 4096, NULL, kvImageEdgeExtend);
    vImageConvolve_ARGB8888(&src, &src, NULL, 0, 0, gaussianblur_kernel, 1, 13, 4096, NULL, kvImageEdgeExtend);

    UIImage *blurImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return blurImage;
}

#pragma mark - Grayscale Transform
typedef enum {
    ALPHA = 0,
    BLUE = 1,
    GREEN = 2,
    RED = 3
}PIXELS;
// wrong scale factor
- (UIImage *)grayImage
{
    CGSize size = self.size;
    int width = size.width;
    int height = size.height;

    // the pixels will be painted to this array
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));

    // clear the pixels so any transparency is preserved
    memset(pixels, 0, width * height * sizeof(uint32_t));

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

    // create a context with RGBA pixels
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);

    // paint the bitmap to our context which will fill in the pixels array
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), self.CGImage);

    for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];

            // convert to grayscale using recommended method: http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
            uint32_t gray = 0.3 * rgbaPixel[RED] + 0.59 * rgbaPixel[GREEN] + 0.11 * rgbaPixel[BLUE];

            // set the pixels to gray
            rgbaPixel[RED] = gray;
            rgbaPixel[GREEN] = gray;
            rgbaPixel[BLUE] = gray;
        }
    }

    // create a new CGImageRef from our context with the modified pixels
    CGImageRef imageRef = CGBitmapContextCreateImage(context);

    // we're done with the context, color space, and pixels
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);

    // make a new UIImage to return
    UIImage *resultUIImage = [UIImage imageWithCGImage:imageRef];

    // we're done with image now too
    CGImageRelease(imageRef);

    return resultUIImage;
}
//better
- (UIImage *)grayscaleImage
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);

    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // Draw a white background
    CGContextSetRGBFillColor(ctx, 1.0f, 1.0f, 1.0f, 1.0f);
    CGContextFillRect(ctx, imageRect);

    // Draw the luminosity on top of the white background to get grayscale
    [self drawInRect:imageRect blendMode:kCGBlendModeLuminosity alpha:1.0f];

    // Apply the source image's alpha
    [self drawInRect:imageRect blendMode:kCGBlendModeDestinationIn alpha:1.0f];

    UIImage *grayscaleImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return grayscaleImage;
}

- (UIImage *)imageWithTintColor:(UIColor *)tintColor
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);

    [tintColor setFill];
    UIRectFill(imageRect);

    [self drawInRect:imageRect blendMode:kCGBlendModeOverlay alpha:1.0f];

    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return tintedImage;
}

@end

@implementation UIImage (Generation)

+ (UIImage *)imageFromUIColor:(UIColor *)color {
    CGSize size = CGSizeMake(3, 3);
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageFromUIColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageFromColorWithRed:(CGFloat)red greed:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    CGSize size = CGSizeMake(3, 3);
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    [[UIColor colorWithRed:red green:green blue:blue alpha:alpha] set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
