//
//  NSTimer+JBlocksSupport.m
//  test
//
//  Created by Jone on 15/6/20.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import "NSTimer+JBlocksSupport.h"

@implementation NSTimer (JBlocksSupport)

+ (NSTimer *)j_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void(^)())block repeats:(BOOL)repeats{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(j_blockInvoke:) userInfo:[block copy] repeats:repeats];
    
}

+ (void)j_blockInvoke:(NSTimer *)timer{
    void (^block) () = timer.userInfo;
    if (block) {
        block();
    }
}

@end
