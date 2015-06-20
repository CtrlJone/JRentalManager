//
//  NSTimer+JBlocksSupport.h
//  test
//
//  Created by Jone on 15/6/20.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (JBlocksSupport)

+ (NSTimer *)j_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void(^)())block repeats:(BOOL)repeats;

@end
