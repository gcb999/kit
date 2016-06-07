//
//  JSItemImageViewTransition.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSItemImageViewTransition.h"

@implementation JSItemImageViewTransition
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
      //1: 得到 containerView
    UIView *containerView = [transitionContext containerView];
    
      //2: 得到 toview fromView
    UIView *toView = [self toView:transitionContext];
    UIView *fromView=[self fromView:transitionContext];
    
    //3: 添加
    toView.alpha = 1.0;
    [containerView addSubview:toView];
    
    if (containerView == nil) {
        return;
    }
   

    
    if (self.transitionMode == kHYBTransitionPresent) {
        
        toView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        
        
        [UIView animateWithDuration:self.duration delay:0 usingSpringWithDamping:self.damp initialSpringVelocity:self.initialSpringVelocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            toView.transform = CGAffineTransformIdentity;
            toView.alpha = 1.0;
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    
    } else if (self.transitionMode == kHYBTransitionDismiss) {
        
  
            [UIView animateWithDuration:self.duration delay:0 usingSpringWithDamping:self.damp initialSpringVelocity:self.initialSpringVelocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
                fromView.transform = CGAffineTransformMakeScale(0.001, 0.001);
                fromView.alpha = 0.0;

            } completion:^(BOOL finished) {
         
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];

    }

}

@end
