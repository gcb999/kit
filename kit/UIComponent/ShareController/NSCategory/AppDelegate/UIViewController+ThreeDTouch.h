//
//  UIViewController+ThreeDTouch.h
//  JSThridPod
//
//  Created by gcb999 on 16/4/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ThreeDTouch)

#pragma mark -注册3DTouch 功能

-(void)register3DTouchWithSourceView:(UIView *)sourceView  peekViewCtrCls:(Class)peekCls;


@property(nonatomic,strong)Class peekCls;

#pragma mark -Peek 手势
//Peek
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location;

#pragma mark -POP 手势
-(void) popViewController:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit;

@end
