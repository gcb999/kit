//
//  JSPresentCommonViewTransition.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSPresentCommonViewTransition.h"

@implementation JSPresentCommonViewTransition

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
        
        
        CGRect hrect,rect=CGRectMake(0, 0, IPHONScreenWidth, IPHONScreenHeight);
        CGRectDivide(rect, &hrect, &rect, IPHONScreenHeight-self.height, CGRectMinYEdge);
        toView.frame=rect;
    
        
        toView.frame=CGRectMake(0, IPHONScreenHeight, IPHONScreenWidth, IPHONScreenHeight);
        [UIView animateWithDuration:self.duration delay:0 usingSpringWithDamping:self.damp initialSpringVelocity:self.initialSpringVelocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            toView.frame=rect;
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    } else if (self.transitionMode == kHYBTransitionDismiss) {
        
        
        [UIView animateWithDuration:self.duration delay:0 usingSpringWithDamping:self.damp initialSpringVelocity:self.initialSpringVelocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
              fromView.frame=CGRectMake(0, IPHONScreenHeight, IPHONScreenWidth, IPHONScreenHeight);
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }
    
}

@end
