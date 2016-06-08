//
//  JSSideSlippingConfig.h
//  SailvanElec
//
//  Created by gcb999 on 16/6/4.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSSideSlippingControllerConfig : NSObject

+(instancetype) shareInstance;

@property (nonatomic, strong) JASidePanelController * sidePanelController;

-(void )leftPanel:(Class)leftPanel centerPanel:(Class)centerPanel  rightPanel:(Class)rightPanel;

#pragma mark -显示中间控制器
-(void)showCenterPanel;

#pragma mark -推到根控制器，显示中间控制器
-(void)exitRootViewControllerForShowCenterPanel;

#pragma mark -显示左侧控制器
-(void)showLeftPanel;
#pragma mark -显示右侧控制器
-(void)showRightPanel;

@end
