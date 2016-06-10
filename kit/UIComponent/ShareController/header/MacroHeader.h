
//
//  MacroHeader.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/23.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#ifndef MacroHeader_h
#define MacroHeader_h


#pragma mark -基本类
//实体
#import "JSUserSingletonModel.h"



#pragma mark -----------第三方头文件------------




//AFN
#import "AFHTTPRequestOperationManager.h"


//图片
#import "UIImageView+WebCache.h"


//md5 编码
#import "JSMD5.h"


//导航手势
#import "UINavigationController+FDFullscreenPopGesture.h"

//mj 上拉
#import "MJRefresh.h"

//MJ 模型编码
#import "MJExtension.h"

//侧滑框架头文件
#import "JASidePanelController.h"

//隐藏头部导航栏
#import <TLYShyNavBar/TLYShyNavBarManager.h>


#pragma mark -----------框架------------

//侧滑框架

#import "JSSideSlippingControllerConfig.h"

//横栏
#import "JSTabbarViewController.h"
#import "JSTabbarViewController+shareInstance.h"
#import "JSTabbarViewController+Badge.h"
#import "JSTabbarViewController+NavigationControllerDelegate.h"







#pragma mark -----------基本控件头文件------------





//父控制
#import "JSBasicViewController.h"
#import "JSBasicViewController+ThreeDTouch.h"

#import "UIViewController+NavigationItem.h"

//导航控制器
#import "JSNavigationController.h"





#pragma mark -----------PickerView &datePick--------------------

#import "JSPickerViewController.h"
#import "JSDatePickerViewController.h"
#import "JSDatePickerViewTransition.h"//动画类


#pragma mark -----------UIButton-------------------
#import "JSDIYButton.h"









#pragma mark -----------网络头文件--------------------


//网络
#import "JSNetWork.h"
#import "JSNetWork+GET.h"
#import "JSNetWork+POST.h"
#import "JSError.h"

//MB
#import "MBProgressHUD+Add.h"




//JSON

//#import "JSON.h"








#pragma mark -----------自定义TableView--------------------



//TableView头文件

#import "JSTableViewController.h"

#import "JSTableViewController+MJRefresh.h"//集成MJ

#import "JSTableViewController+TableView.h"//集成tableview代理方法

#import "JSTableViewCellDelegate.h"//集成cell代理

#import "JSTableViewController+NotWorkView.h"//集成无网view

#import "JSTableViewController+TableHeaderFooter.h"//头部底部

#import "JSTableViewController+StretchableTableHeaderView.h"//头部放大

#import "JSTableViewController+ThreeDTouch.h"////3DTouch

#import "JSTableViewControllerDelegate.h"

#import "JSTableGroupViewController.h"//分组



#pragma mark -------UITableViewCell-------

/*
 1:图片
 
 2：文字
 
 3：箭头
 
 */
#import "JSSimpleTableViewCell.h"
#import "JSSimpleTableViewCellModelGroupHelper.h"//单行
#import "JSSimpleTableViewCellModelSingleHelper.h"//分组



#pragma mark -----------自定义CollectionView头文件--------------------


//Collection头文件

#import "JSCollectionViewController.h"
#import "JSCollectionViewController+MJRefresh.h"
#import "JSCollectionViewController+NotWorkView.h"
#import "JSCollectionViewController+CollectionView.h"

#import "JSCollectionViewDelegate.h"//代理方法

#import "JSCollectionViewController+ThreeDTouch.h"//3DTouch



//流水瀑布
#import "JSBaseFlowLayout.h"
#import "JSLineLayout.h"
#import "JSWaterFlowLayout.h"


//轮播图
#import "SDCycleScrollView.h"




#pragma mark -----------FB,GA,ShareSDK--------------

#import "JSFaceBook.h"



#pragma mark -----------基本类+Category--------------

//获取系统信息


#import "UIDevice+Extend.h"


//AppDelegate
#import "AppDelegate+ThridDTouch.h"//集成3DTouch



//字体
#import "UIFont+Extend.h"


//颜色
#import "UIColor+Extend.h"


//字典

#import "NSDictionary+Extension.h"


//数组

#import "NSArray+Extend.h"



//日期

#import "NSDate+Extend.h"
#import "NSDate+stringFromDate.h"

//NSMutableAttributedString
#import "NSMutableAttributedString+CBAttributedString.h"


//字符串

#import "NSString+Extend.h"

#import "NSString+Password.h"

#import "NSString+dateFromString.h"


//NSOject

#import "NSObject+Utilty.h"

#import "NSObject+SDWebImage.h"

#import "NSObject+UICateGory.h"

#import "NSObject+Extend.h"



//动画
#import "CALayer+Anim.h"

#import "CALayer+Transition.h"


//window

#import "UIWindow+Launch.h"


//NavigationViewController

#import "UIViewController+NavigationItem.h"


//UIView
#import "UIView+Extend.h"
#import "UIView+Coordinates.h"
#import "UIView+Badge.h"



//----沙盒，归档-------

#import "CoreArchive.h"




#pragma mark -------------------UIView的坐标坐标-------------------------



//get the left top origin's x,y of a view
#define KVIEW_TOP_X(view) (view.frame.origin.x)//view 的x
#define KVIEW_TOP_Y(view) (view.frame.origin.y)// view 的y


//get the width size of the view:width,height
#define KVIEW_W(view)  (view.frame.size.width)
#define KVIEW_H(view)  (view.frame.size.height)

//get the right bottom origin's x,y of a view
#define KVIEW_BOTTOM_X(view) (view.frame.origin.x + view.frame.size.width)
#define KVIEW_BOTTOM_Y(view) (view.frame.origin.y + view.frame.size.height )


//get the x,y of the frame
#define KFRAME_TOP_X(frame)  (frame.origin.x)
#define KFRAME_TOP_Y(frame)  (frame.origin.y)

//get the size of the frame
#define KFRAME_W(frame)  (frame.size.width)
#define KFRAME_H(frame)  (frame.size.height)







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



