//
//  JSTabBarControllerConfig+Badge.m
//  kit
//
//  Created by gcb999 on 16/6/14.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabBarControllerConfig+Badge.h"

@implementation JSTabBarControllerConfig (Badge)

-(void)showBadgeWithStyle:(WBadgeStyle)style badge:(NSInteger)badge tabbarIndex:(NSInteger)index animationType:(WBadgeAnimType)aniType{
    
    
    UITabBar *bar=self.tabBarController.tabBar;
    UITabBarItem *item= bar.items[index];
    //it is necessary to adjust badge position
    if (IS_IPHONE6) {
            item.badgeCenterOffset = CGPointMake(-35, 8);
    }

    [item showBadgeWithStyle:style value:badge animationType:aniType];
    
}

-(void)hiddenBageWithTabbarIndex:(NSInteger)index{
    
    UITabBar *bar=self.tabBarController.tabBar;
    UITabBarItem *item= bar.items[index];
    [item clearBadge];
}

@end
