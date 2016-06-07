//
//  HYBMoveTransition.m
//  HYBTransitionAnimations
//
//  Created by huangyibiao on 16/3/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "HYBMoveTransition.h"

@implementation HYBMoveTransition


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  UIView *containerView = [transitionContext containerView];
  
  if (containerView == nil) {
    return;
  }
  
  if (self.targetClickedView == nil) {
    NSLog(@"targetClickedView property can't be nil.");
    return;
  }
  
  if (self.transitionMode == kHYBTransitionPush) {
    UIView *toView = [self toView:transitionContext];
    toView.alpha = 1.0;
      
    //1:tempView是一个临时拷贝View
    UIView *tempView = [self.targetClickedView snapshotViewAfterScreenUpdates:NO];
    
    //2: tempView 的原始坐标 (From Controller 图片View的大小）
    tempView.frame = [self.targetClickedView convertRect:self.targetClickedView.bounds
                                                  toView:containerView];
    
      
    //3： To Controller 新的View坐标（To Controller 图片View的大小)，并且先隐藏
      
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.hyb_toTargetView.alpha = 0.0;
    CGRect targetRect = [toVC.hyb_toTargetView convertRect:toVC.hyb_toTargetView.bounds
                                                      toView:containerView];
    self.targetClickedView.alpha = 0.0;//先隐藏

      
    //4：重新加入TOView 和临时拷贝tempView
    [containerView addSubview:toView];
    [containerView addSubview:tempView];
    
    
    

    
    if (self.animatedWithSpring) {
      [UIView animateWithDuration:self.duration delay:0 usingSpringWithDamping:self.damp initialSpringVelocity:self.initialSpringVelocity options:0 animations:^{
        
          tempView.frame = targetRect;//tempView 由From View控制器 变成 To ViewController 的大小
          
      } completion:^(BOOL finished) {
        
        toView.alpha = 1.0;//
          
        tempView.alpha = 0.0;//隐藏临时拷贝tempView
          
        toVC.hyb_toTargetView.alpha = 1.0;//显示To新ImgView
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
          
      }];
        
        
    } else {
      [UIView animateWithDuration:self.duration animations:^{
        tempView.frame = targetRect;//tempView 由From View控制器 变成 To ViewController 的大小
      } completion:^(BOOL finished) {
        toView.alpha = 1.0;
        tempView.alpha = 0.0;//隐藏临时拷贝tempView
        toVC.hyb_toTargetView.alpha = 1.0;//显示To新ImgView
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
      }];
    }
  } else if (self.transitionMode == kHYBTransitionPop) {
      
    //1: 得到 toview,FromView
    UIView *toView = [self toView:transitionContext];
    UIView *fromView = [self fromView:transitionContext];
      
     //2: 得到临时tempView
    UIView *tempView = [containerView.subviews lastObject];
    
    toView.alpha = 1.0;
    fromView.alpha = 1.0;
    tempView.alpha = 1.0;
      

    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    fromVC.hyb_toTargetView.alpha = 0.0;
    
      //3：添加toview,tempView到containerView上
    [containerView addSubview:toView];
    [containerView bringSubviewToFront:tempView];
    
    //4：得到To VC 中Cell中图片大小
    CGRect originalRect = [self.targetClickedView convertRect:self.targetClickedView.bounds
                                                       toView:containerView];
    
    if (self.animatedWithSpring) {
      [UIView animateWithDuration:self.duration delay:0 usingSpringWithDamping:self.damp initialSpringVelocity:self.initialSpringVelocity options:0 animations:^{
        tempView.frame = originalRect;//由原始大坐标--->小坐标
      } completion:^(BOOL finished) {
        toView.alpha = 1.0;
        tempView.alpha = 0.0;//隐藏拷贝tempView
        [tempView removeFromSuperview];//并且移除
        self.targetClickedView.alpha = 1.0;//To VC中Cell显示
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
      }];
    } else {
      [UIView animateWithDuration:self.duration animations:^{
        tempView.frame = originalRect;
      } completion:^(BOOL finished) {
        toView.alpha = 1.0;
        tempView.alpha = 0.0;
        [tempView removeFromSuperview];
        self.targetClickedView.alpha = 1.0;
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
      }];
    }
  } else {
    NSLog(@"Only support kHYBTransitionPush and kHYBTransitionPop mode.");
  }
}

@end
