//
//  UIImage+category.h
//  JRentalManager
//
//  Created by Jone ji on 15/5/15.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (category)
/**
 *  创建有颜色生成的图片
 *
 *  @param color 颜色
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 *  创建由颜色生成的图片
 *
 *  @param color 颜色
 *  @param rect  大小
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color andRect:(CGRect)rect;
/**
 *  这是图片的毛玻璃效果
 *
 *  @param blur 毛玻璃效果的程度0~1
 *
 *  @return 图片
 */
- (UIImage*)drn_boxblurImageWithBlur:(CGFloat)blur;
/**
 *  取出图片的整体颜色值
 *
 *  @return 颜色
 */
- (UIColor *)averageColor;
/**
 *  设置图片的透明度
 *
 *  @param alpha 透明度的值0~1
 *
 *  @return 图片
 */
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;
/**
 *  添加玻璃效果的滤镜
 *
 *  @return 图片
 */
- (UIImage *)imageWithGlass;
/**
 *  给图片描边
 *
 *  @return 返回描边后的图片
 */
- (UIImage *)strokeImage;

@end
