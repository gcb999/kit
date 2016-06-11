//
//  UIViewController+ShyNavBar.h
//  kit
//
//  Created by gcb999 on 16/6/11.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (ShyNavBar)

#pragma mark -滚动时候，自动隐藏和显示头部导航栏
-(void)ShyNavBar:(UIScrollView *)scrollerView;

#pragma mark -滚动时候，自动隐藏和显示头部导航栏 (附加头部view)
-(void)ShyNavBar:(UIScrollView *)scrollerView extensionView:(UIView *)extensionView;
@end
