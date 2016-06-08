//
//  JSFaceBook.h
//  kit
//
//  Created by gcb999 on 16/6/8.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <Bolts/BFURL.h>

typedef NS_ENUM(NSUInteger, JSFaceBookLoginState) {
    JSFaceBookLoginError,
    JSFaceBookLoginCancel,
    JSFaceBookLoginOK
    
};


typedef NS_ENUM(NSUInteger, JSFaceBookShareState) {
    JSFaceBookShareError,
    JSFaceBookShareCancel,
    JSFaceBookShareOK
    
};


typedef void (^ShareCompleteBlock) (JSFaceBookShareState shareState);





@interface JSFaceBook : JSSingletonModel




/*--------------------FaceBook  配置注意点-------
 
一：info.Plist 配置
 
1: 添加FacebookAppID  Key
 
例子
 
FacebookAppID  1558481964435547

 
二：Url Type 配置

1： 添加一个URL
 
例子
 
fb1558481964435547
 
 三；LSApplicationQueriesSchemes 配置
 
 
 详见FB开发文档配置
 
 
*/




#pragma mark-  1：初始化方法 (appDelegate)

/*
 1：初始化FaceBook  在AppDelegate
 
 步骤1： 在didFinishLaunchingWithOptions初始化
 
 步骤2： 在openURL: sourceApplication: 配置初始化工作
 
 */

-(void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;


- (BOOL)application:(UIApplication *)application   openURL:(NSURL *)url  openCtrlClass:(Class)openCtrlClass  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;



#pragma mark-  2: 登陆功能

-(void)loginFromViewController:(UIViewController *)fromViewController complete:(void (^)(JSFaceBookLoginState LoginState,id complete))complete;



#pragma mark-  3：分享（待Link)

- (void)shareForFacebook:(NSString *)shareText shareImageUrl:(NSString *)imagePath ShareCompleteBlock:(ShareCompleteBlock)shareCompleteBlock;

#pragma mark- 4：layOut

-(void)LoginOut;


@end
