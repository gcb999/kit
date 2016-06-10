//
//  JSTabbarViewController+Badge.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabbarViewController+Badge.h"

@implementation JSTabbarViewController (Badge)


-(void)showBadge:(NSString *)badge tabbarIndex:(NSInteger)index Animation:(BOOL)animation{
    
    JSTabbarItem *item=[self.tabbar tabbarItem:index];//得到当前TabbarItem
    if (animation) {
        [item showBadge:badge animationType:JSBadgeAnimTypeScale];
    }
    else{
        [item showBadge:badge animationType:JSBadgeAnimTypeNone];
    }
}

-(void)hiddenBageWithTabbarIndex:(NSInteger)index{
     JSTabbarItem *item=[self.tabbar tabbarItem:index];//得到当前TabbarItem
    [item hideBadge];
}


@end
