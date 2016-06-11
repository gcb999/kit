
//
//  MacroHeader.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/23.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#ifndef MacroHeader_h
#define MacroHeader_h






#pragma mark -------------------UIView的坐标坐标-------------------------




//获取RGB颜色


#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define rgb(r,g,b) rgba(r,g,b,1.0f)

//大写
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)


#define hexColor(colorV) [UIColor colorWithHexColorString:@#colorV]
#define hexColorAlpha(colorV,a) [UIColor colorWithHexColorString:@#colorV alpha:a];



#define KborderColor     rgb(230, 230, 231)
//主色
#define KCOLOR_MAIN   [UIColor orangeColor]
//黑色
#define KCOLOR_BLACK  [UIColor blackColor]
//白色
#define KCOLOR_WHITE  [UIColor whiteColor]
//红色
#define KCOLOR_RED    [UIColor redColor]

//清除背景色
#define KCLEAR_COLOR [UIColor clearColor]

//背景色
#define KBACKGROUND_COLOR [UIColor colorWithRed:242.0/255.0 green:236.0/255.0 blue:231.0/255.0 alpha:1.0]










#pragma mark ----------------SDWebImage中背景图片和错误图片定制----------------


//错误背景图片
#define KBANNER_ERROR_IMGURL  @""

#define KBIGPRODUCT_ERROR_IMGURL  @""

#define KMIDDLEPRODUCT_ERROR_IMGURL  @""

#define KSMALLPRODUCT_ERROR_IMGURL  @""



//默认背景图片
#define KBANNER_DEAFAULT_IMGURL  @""

#define KBIGPRODUCT_DEAFAULT_IMGURL  @""

#define KMIDDLEPRODUCT_DEAFAULT_IMGURL  @""

#define KSMALLPRODUCT_DEAFAULT_IMGURL  @""




#pragma mark ---------------UI上的宏----------------



//获取UIImage  (建议使用前两种宏定义,性能高于后者)

#define IMAGE_CONTENT_FILE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]//读取本地图片


#define IMAGE_CONTENT_FILES(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]//定义UIImage对象


#define IMAGE_NAME(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]//定义UIImage对象


//获取delegate
#define APPDELEGATE [(AppDelegate*)[UIApplication sharedApplication] delegate]


//获取根控制器
#define ROOT_NAV_VC (UINavigationController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController]



#pragma mark ---------------字符串---------------

#define STRING_WITH_FORMAT_INT(interger)       [NSString stringWithFormat:@"%ld",(long)(interger)]
#define STRING_WITH_FORMAT_FLOAT(float)        [NSString stringWithFormat:@"%f",(float)]



#pragma mark ---------------校验相关---------------

#define STRINGHASVALUE(str)  (str && [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0)

//字符串
#define IS_NSString(str)     (str &&  [str isKindOfClass:[NSString class]] && [str length] > 0 )

//数组
#define IS_NSArray(arr)      ( arr && (arr != nil) && [arr isKindOfClass:[NSArray class]] )

//字典
#define IS_NSDictionary(dic)        ( dic && (dic != nil) && [dic isKindOfClass:[NSDictionary class]] )

//NSNull
#define IS_NSNull(class)      [class isKindOfClass:[NSNull class]





#pragma mark ---------------获取沙盒的信息----------------

#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

//读取bundle

#define BUNDLE_PATH_IMAGENAME(c) [[NSBundle mainBundle] pathForResource:c ofType:nil]





//-------------------打印日志-------------------------
//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif






#endif /* MacroHeader_h */



