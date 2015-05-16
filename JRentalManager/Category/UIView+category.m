//
//  UIView+category.m
//  JRentalManager
//
//  Created by Jone ji on 15/5/15.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import "UIView+category.h"

@implementation UIView (category)

- (UIImage *)screenshot {
    UIGraphicsBeginImageContext(self.bounds.size);
    if([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]){
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    }
    else{
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imageData = UIImageJPEGRepresentation(image, 0.75);
    image = [UIImage imageWithData:imageData];
    return image;
}
@end
