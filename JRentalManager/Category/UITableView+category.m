//
//  UITableView+category.m
//  JRentalManager
//
//  Created by Jone ji on 15/6/4.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import "UITableView+category.h"

@implementation UITableView (category)


- (void) registerClassforCellWithIdentifier:(NSString *) cellId
{
    [self registerClass:NSClassFromString(cellId) forCellReuseIdentifier:cellId];
}

- (void) registerClassforHeadFootWithIdentifier:(NSString *) headfootId
{
    [self registerClass:NSClassFromString(headfootId) forHeaderFooterViewReuseIdentifier:headfootId];
}

- (void) registerNIbforCellWithIdentifier:(NSString *) cellId
{
    [self registerNib:[UINib nibWithNibName:cellId bundle:nil] forCellReuseIdentifier:cellId];
}

- (void) registerNIbforHeadFootWithIdentifier:(NSString *) headfootId
{
    [self registerNib:[UINib nibWithNibName:headfootId bundle:nil] forHeaderFooterViewReuseIdentifier:headfootId];
}

@end
