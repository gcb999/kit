//
//  UIViewController+ShyNavBar.m
//  kit
//
//  Created by gcb999 on 16/6/11.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "UIViewController+ShyNavBar.h"
#import <TLYShyNavBar/TLYShyNavBarManager.h>

@implementation UIViewController (ShyNavBar)

//参考文章 https://github.com/telly/TLYShyNavBar#how-it-works

-(void)ShyNavBar:(UIScrollView *)scrollerView{
        self.shyNavBarManager.scrollView = scrollerView;
    
}

-(void)ShyNavBar:(UIScrollView *)scrollerView extensionView:(UIView *)extensionView
{
    self.shyNavBarManager.scrollView=scrollerView;
    [self.shyNavBarManager setExtensionView:extensionView];
//    
//    /* Make navbar stick to the top */
//    [self.shyNavBarManager setStickyNavigationBar:self.stickyNavigationBar];
//    /* Make the extension view stick to the top */
//    [self.shyNavBarManager setStickyExtensionView:self.stickyExtensionView];
//    /* Navigation bar fade behavior */
//    [self.shyNavBarManager setFadeBehavior:self.fadeBehavior];
//    
    
}


@end
