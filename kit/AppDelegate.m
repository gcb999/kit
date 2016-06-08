//
//  AppDelegate.m
//  kit
//
//  Created by gcb999 on 16/6/6.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "JSTabbarViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    
#pragma mark -配置FB
    [[JSFaceBook shareInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    
#pragma mark -配置导航栏
    [JSNavigationController initialize];
    
   
    // 侧滑
//    JSSideSlippingControllerConfig* config= [[JSSideSlippingControllerConfig alloc] initWithLeftPanel:[HomeViewController class] centerPanel:[HomeViewController class] rightPanel:[HomeViewController class]];
    
    //横栏
   JSTabbarViewController *config=[[JSTabbarViewController alloc] init];
    
    [self.window setRootViewController:config];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    

    return YES;
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    return [[JSFaceBook shareInstance] application:application openURL:url openCtrlClass:nil sourceApplication:sourceApplication annotation:annotation];
    
}

@end
