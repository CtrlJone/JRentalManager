//
//  MacroDefinition.h
//  JRentalManager
//
//  Created by Jone ji on 15/5/15.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#ifndef JRentalManager_MacroDefinition_h
#define JRentalManager_MacroDefinition_h

//系统屏幕的宽和高
#define JSCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define JSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//获取系统版本
#define JIOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//获取当前语言
#define JCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

// 获取RGB颜色
#define JRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define JRGB(r,g,b) RGBA(r,g,b,1.0f)

//根据类名得到Identifier
#define JIdentifier(A) NSStringFromClass([A class])







#endif
