//
//  UITableView+category.h
//  JRentalManager
//
//  Created by Jone ji on 15/6/4.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (category)

- (void) registerClassforCellWithIdentifier:(NSString *) cellId;

- (void) registerClassforHeadFootWithIdentifier:(NSString *) headfootId;

- (void) registerNIbforCellWithIdentifier:(NSString *) cellId;

- (void) registerNIbforHeadFootWithIdentifier:(NSString *) headfootId;

@end
