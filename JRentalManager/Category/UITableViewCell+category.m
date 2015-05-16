//
//  UITableViewCell+category.m
//  JRentalManager
//
//  Created by Jone on 15/5/16.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import "UITableViewCell+category.h"

@implementation UITableViewCell (category)

-(void)setSeparatorInsetMarginZero
{
    self.separatorInset = UIEdgeInsetsZero;
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        self.layoutMargins = UIEdgeInsetsZero;
    }
    if ([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        self.preservesSuperviewLayoutMargins = NO;
    }
}

@end
