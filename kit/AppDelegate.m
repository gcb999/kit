//
//  AppDelegate.m
//  kit
//
//  Created by gcb999 on 16/6/6.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 侧滑
    //JSSideSlippingControllerConfig* config= [[JSSideSlippingControllerConfig alloc] initWithSidePlane:[AccountGroupViewController class] mainClass:[AcountViewController class]  rightClass:[LeftViewController class] ];
    
    //横栏
    JSTabBarControllerConfig *config=[[JSTabBarControllerConfig alloc] init];
    
    [self.window setRootViewController:config.tabBarController];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
