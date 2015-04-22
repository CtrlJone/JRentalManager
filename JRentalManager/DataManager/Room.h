//
//  Room.h
//  JRentalManager
//
//  Created by Jone on 15/4/8.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Room : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSDate * beginDate;
@property (nonatomic, retain) NSDate * endDate;

@end
