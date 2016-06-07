//
//  JSCollectionViewController+ThreeDTouch.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSCollectionViewController+ThreeDTouch.h"

@implementation JSCollectionViewController (ThreeDTouch)

/**
 *  peek手势
 */
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    
   
    return [self.delegate JSCollectionViewController:self previewingContext:previewingContext viewControllerForLocation:location];
        

}


/**
 *  pop手势
 */
-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    
    [self.delegate JSCollectionViewController:self popViewController:previewingContext commitViewController:viewControllerToCommit];
    
}






@end
