//
//  UIViewController+NavigationItem.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/24.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "UIViewController+NavigationItem.h"

@implementation UIViewController (NavigationItem)

#pragma mark ---返回按钮
- (void)addBackBtn
{
    UIBarButtonItem *backbutton=[[UIBarButtonItem  alloc] initWithTitle:@"く返回" style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    self.navigationItem.leftBarButtonItem=backbutton;
}


-(void)goback{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
