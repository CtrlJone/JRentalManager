//
//  UIColor+category.m
//  JRentalManager
//
//  Created by Jone on 15/5/16.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import "UIColor+category.h"

@implementation UIColor (category)

+(instancetype)blackTranslucentColor
{
    return [[self class] colorWithWhite:0 alpha:0.5];
}

@end
