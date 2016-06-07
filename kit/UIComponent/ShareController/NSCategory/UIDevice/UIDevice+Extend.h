//
//  UIDevice+Extend.h
//  CoreCategory
//
//  Created by 成林 on 15/5/6.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import <UIKit/UIKit.h>

//ios系统版本
#define ios8x [[[UIDevice currentDevice] systemVersion] floatValue] >=8.0f
#define ios7x ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
#define ios6x [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0f
#define iosNot6x [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f



#define IS_IPHONE4 ([UIScreen mainScreen].bounds.size.height == 480.f)

#define IS_IPHONE5 ([UIScreen mainScreen].bounds.size.height == 568.f)

#define IS_IPHONE6 ([UIScreen mainScreen].bounds.size.height == 667.f)

#define IS_IPHONE6_PLUS ([UIScreen mainScreen].bounds.size.height == 736.f)



//IPHONE 高度 和宽度

#define IPHONScreenWidth    [[UIScreen mainScreen] bounds].size.width

#define IPHONScreenHeight    [[UIScreen mainScreen] bounds].size.height


//获取设备系统版本 7.0
#define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue]>=7.0 ?YES:NO

#define KIOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define KCURRENT_SYSTEM_VERSION ([[UIDevice currentDevice] systemVersion])


// App
#define KAPP_VERSION      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


//获取当前语言
#define KCURRENT_LANGUAGES ([[NSLocale preferredLanguages] objectAtIndex:0])




@interface UIDevice (Extend)


@end
