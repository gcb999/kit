//
//  JSSideSlippingConfig.m
//  SailvanElec
//
//  Created by gcb999 on 16/6/4.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSSideSlippingControllerConfig.h"

//https://github.com/gotosleep/JASidePanels




@implementation JSSideSlippingControllerConfig


-(JASidePanelController *)sidePanelController{
    
    if (_sidePanelController==nil) {
            _sidePanelController = [[JASidePanelController alloc] init];
            _sidePanelController.shouldDelegateAutorotateToVisiblePanel = NO;  //这个啥作用，暂时不清楚
        
            //左视图间距
            _sidePanelController.leftGapPercentage = 0.8;   //左边的viewcontroller显示的宽度
            _sidePanelController.bounceOnSidePanelClose = NO;  //当关闭侧边栏的时候不反弹
            _sidePanelController.maximumAnimationDuration = 0;  //最大的反弹动画范围
        
            //右视图间距
            _sidePanelController.rightGapPercentage = 0.3;   //左边的viewcontroller显示的宽度

        
    }
    return _sidePanelController;
}



-(instancetype )initWithSidePlane:(Class)leftClass mainClass:(Class)mainClass  rightClass:(Class)rightClass{
    
    if (self=[super init]) {
    
    //左边控制器
    
    if(leftClass){
        
        UIViewController *leftVc=[[leftClass  alloc] init];
        self.sidePanelController.leftPanel = leftVc;  //添加左边的viewcontroller

    }
   

    //中间
    if (mainClass) {
        
        UIViewController *mainCtrl = [[mainClass  alloc] init];
        JSNavigationController *nav=[[JSNavigationController alloc] initWithRootViewController:mainCtrl];
        self.sidePanelController.centerPanel = nav;  //添加中间的viewcontroller
    }
    
    
    //右边控制器
    if (rightClass) {
       
        UIViewController *rightVc=[[rightClass alloc] init];
        self.sidePanelController.rightPanel=rightVc;//添加右边的viewcontroller
    }
    
    
}

    return self;
}



#pragma mark -显示中间控制器
-(void)showCenterPanel{
    [self.sidePanelController showCenterPanelAnimated:YES];
}

#pragma mark -显示中间控制器
-(void)exitRootViewControllerForShowCenterPanel{
//1：退出根控制器
UINavigationController *nav=(UINavigationController *)self.sidePanelController.centerPanel;
[nav popToRootViewControllerAnimated:YES];

//2：展示中间
[self.sidePanelController showCenterPanelAnimated:YES];

}

#pragma mark -显示左侧控制器
-(void)showLeftPanel{
    [self.sidePanelController showLeftPanelAnimated:YES];
}

#pragma mark -显示右侧控制器
-(void)showRightPanel{
    [self.sidePanelController showRightPanelAnimated:YES];
}




#pragma mark -单例类
static JSSideSlippingControllerConfig * _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [JSSideSlippingControllerConfig shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [JSSideSlippingControllerConfig shareInstance] ;
}

@end
