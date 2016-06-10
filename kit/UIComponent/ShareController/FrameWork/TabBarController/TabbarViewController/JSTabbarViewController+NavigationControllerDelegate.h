//
//  JSTabbarViewController+NavigationControllerDelegate.h
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabbarViewController.h"

@interface JSTabbarViewController (NavigationControllerDelegate)

-(void)showTabbar;

#pragma mark -隐藏tabbar,改变ContentView高度

-(void)hiddenTabbar;
    
@end
