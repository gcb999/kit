//
//  JSNavigationController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/24.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSNavigationController.h"

@interface JSNavigationController ()

@end

@implementation JSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

+ (void)initialize {
    
    // 1.appearance方法返回一个导航栏的外观对象
    
    //修改了这个外观对象，相当于修改了整个项目中的外观
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];

    
    // 2:通过barTintColor来设置背景色
    [navigationBar setBarTintColor:[UIColor blackColor]];
    
    
  
//    if(KIOS_VERSION>=8.0f) navigationBar.translucent=NO;

    
    //3: 设置字体大小与颜色
    navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:21.0],//字体大小
                                          NSForegroundColorAttributeName:[UIColor whiteColor]//字体颜色
                                          
                                          };
    // 4.设置导航栏文字的主题
   
    NSShadow *shadow = [[NSShadow alloc]init];
    [shadow setShadowOffset:CGSizeZero];
    
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"navImages"] forBarMetrics:UIBarMetricsDefault];
    
    // 4.修改所有UIBarButtonItem的外观
    
    

    
    // 5.设置状态栏样式
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {


    if (self.viewControllers.count > 0) {
     viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
