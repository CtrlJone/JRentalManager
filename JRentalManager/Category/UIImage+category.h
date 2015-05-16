//
//  UIImage+category.h
//  JRentalManager
//
//  Created by Jone ji on 15/5/15.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (category)

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color andRect:(CGRect)rect;

- (UIImage*)drn_boxblurImageWithBlur:(CGFloat)blur;

@end
