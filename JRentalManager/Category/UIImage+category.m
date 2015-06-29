//
//  UIImage+category.m
//  JRentalManager
//
//  Created by Jone ji on 15/5/15.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import "UIImage+category.h"
#import <Accelerate/Accelerate.h>
//#import <opencv2/imgproc/types_c.h>
//#import <opencv2/imgcodecs/ios.h>

@implementation UIImage (category)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [self imageWithColor:color andRect:CGRectMake(0, 0, 1, 1)];
}

+ (UIImage *)imageWithColor:(UIColor *)color andRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage*)drn_boxblurImageWithBlur:(CGFloat)blur
{
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = self.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    
    //create vImage_Buffer with data from CGImageRef
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    //perform convolution
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend)
    ?: vImageBoxConvolve_ARGB8888(&outBuffer, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend)
    ?: vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    //free(pixelBuffer2);
    CFRelease(inBitmapData);
    CGImageRelease(imageRef);
    return returnImage;
}

- (UIColor *)averageColor {
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char rgba[4];
    CGContextRef context = CGBitmapContextCreate(rgba, 1, 1, 8, 4, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGContextDrawImage(context, CGRectMake(0, 0, 1, 1), self.CGImage);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    
    if(rgba[3] > 0) {
        CGFloat alpha = ((CGFloat)rgba[3])/255.0;
        CGFloat multiplier = alpha/255.0;
        return [UIColor colorWithRed:((CGFloat)rgba[0])*multiplier
                               green:((CGFloat)rgba[1])*multiplier
                                blue:((CGFloat)rgba[2])*multiplier
                               alpha:alpha];
    }
    else {
        return [UIColor colorWithRed:((CGFloat)rgba[0])/255.0
                               green:((CGFloat)rgba[1])/255.0
                                blue:((CGFloat)rgba[2])/255.0
                               alpha:((CGFloat)rgba[3])/255.0];
    }
}

- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, self.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)imageWithGlass
{
    // 数据源 + 设置
    CIImage *ciImage = [[CIImage alloc] initWithImage:self];
    NSDictionary *params = @{
                             kCIInputImageKey: ciImage,
                             };
    
    // 初始化滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIGlassDistortion"
                            withInputParameters:params];
    [filter setDefaults];
    
    
    // 输入变形参数
    if ([filter respondsToSelector:NSSelectorFromString(@"inputTexture")]) {
        CIImage *ciTextureImage = [[CIImage alloc] initWithImage:[UIImage imageNamed:@"grassdistortion"]];
        [filter setValue:ciTextureImage forKey:@"inputTexture"];
    }
    
    // 创建上下文 + 输出图片
    CIContext *context   = [CIContext contextWithOptions:nil];
    CIImage *outputImage = [filter outputImage];
    
    // 获取图片
    CGImageRef cgImage   = [context createCGImage:outputImage
                                         fromRect:[outputImage extent]];
    // 获取图片
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    
    // 释放资源
    CGImageRelease(cgImage);
    
    return image;
}

- (UIImage *)strokeImage
{
//    cv::Mat cvImage;
//    // Convert UIImage * to cv::Mat
//    UIImageToMat(self, cvImage);
//    if (!cvImage.empty()) {
//        cv::Mat gray;
//        // Convert the image to grayscale;
//        cv::cvtColor(cvImage, gray, CV_RGBA2GRAY);
//        // Apply Gaussian filter to remove small edges
//        cv::GaussianBlur(gray, gray, cv::Size(5,5), 1.2,1.2);
//        // Calculate edges with Canny
//        cv::Mat edges;
//        cv::Canny(gray, edges, 0, 60);
//        // Fill image with white color
//        cvImage.setTo(cv::Scalar::all(255));
//        // Change color on edges
//        cvImage.setTo(cv::Scalar(0,128,255,255),edges);
//        // Convert cv::Mat to UIImage* and show the resulting image
//        return MatToUIImage(cvImage);
//    }
    return nil;
}

@end
