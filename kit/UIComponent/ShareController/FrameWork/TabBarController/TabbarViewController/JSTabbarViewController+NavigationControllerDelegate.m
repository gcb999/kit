//
//  JSTabbarViewController+NavigationControllerDelegate.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabbarViewController+NavigationControllerDelegate.h"

@implementation JSTabbarViewController (NavigationControllerDelegate)


#pragma mark -显示tabbar

-(void)showTabbar{
    
    // 显示tabbar
    CGRect frame = self.tabbar.frame;
    frame.origin.y = self.view.bounds.size.height - self.tabbar.bounds.size.height;
    self.tabbar.frame = frame;
    
    // 改变contentView的高度
    frame = self.contentView.frame;
    frame.size.height = self.tabbar.frame.origin.y;
    self.contentView.frame = frame;
}

#pragma mark -隐藏tabbar,改变ContentView高度

-(void)hiddenTabbar{
    
    // 隐藏tabbar
    CGRect frame = self.tabbar.frame;
    frame.origin.y = self.view.bounds.size.height+15;
    self.tabbar.frame = frame;
    
    // 改变contentView的高度
    frame = self.contentView.frame;
    frame.size.height = self.view.bounds.size.height;
    self.contentView.frame = frame;
}


#pragma mark - 导航控制器代理方法
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIViewController *root = [navigationController.viewControllers objectAtIndex:0];
   
    if (viewController == root) {
        // 回到根控制器，显示tabbar
        [UIView animateWithDuration:0.3 animations:^{
            [self showTabbar];
        }];
        
    }
else {
        // 左边的返回按键
//        UIButton *btn = [[UIButton alloc] init];
//        UIImage *back = [UIImage imageNamed:@"navigationbar_back.png"];
//        [btn setBackgroundImage:back forState:UIControlStateNormal];
//        UIImage *back2 = [UIImage imageNamed:@"navigationbar_back_highlighted.png"];
//        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        [btn setBackgroundImage:back2 forState:UIControlStateHighlighted];
//        btn.bounds = CGRectMake(0, 0, back.size.width, back.size.height);
//        
//                UIBarButtonItem *left = [[[UIBarButtonItem alloc] initWithCustomView:btn] ];
//                viewController.navigationItem.leftBarButtonItem = left;
    
        // 右边的home按键
//        btn = [[UIButton alloc] init];
//        UIImage *home = [UIImage imageNamed:@"navigationbar_home.png"];
//        [btn setBackgroundImage:home forState:UIControlStateNormal];
//        UIImage *home2 = [UIImage imageNamed:@"navigationbar_home_highlighted.png"];
//        [btn addTarget:self action:@selector(home) forControlEvents:UIControlEventTouchUpInside];
//        [btn setBackgroundImage:home2 forState:UIControlStateHighlighted];
//        btn.bounds = CGRectMake(0, 0, home.size.width, home.size.height);
    
        //        UIBarButtonItem *right = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
        //        viewController.navigationItem.rightBarButtonItem = right;
        
        // 跳到其他控制器，隐藏tabbar
        [UIView animateWithDuration:0.3 animations:^{
            [self hiddenTabbar];
        }];
        
//        _currentController = viewController;
    }
}


//#pragma mark 返回
//- (void)back {
//    [_currentController.navigationController popViewControllerAnimated:YES];
//}
//
//#pragma mark home
//- (void)home {
//    [_currentController.navigationController popToRootViewControllerAnimated:YES];
//}
@end
