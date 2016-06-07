//
//  DLBasicViewController.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 15/12/16.
//  Copyright © 2015年 gcb999. All rights reserved.
//

#import "JSBasicViewController.h"

@interface JSBasicViewController ()
{
    
}

@end

@implementation JSBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //解决滚动视图20像素的偏移
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationController.navigationBarHidden = NO;
 
//    self.fd_prefersNavigationBarHidden = YES;//--侧滑不需要
    
    if(IOS7){
        self.edgesForExtendedLayout=UIRectEdgeNone;
    }

   
  
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}



#pragma mark - prviteMethods
- (void)showOrHidde:(BOOL)show animation:(BOOL)animation
{
    
    UITabBar *tabbar=[JSTabBarControllerConfig shareInstance].tabBarController.tabBar;
    tabbar.hidden=YES;
    
}














@end
