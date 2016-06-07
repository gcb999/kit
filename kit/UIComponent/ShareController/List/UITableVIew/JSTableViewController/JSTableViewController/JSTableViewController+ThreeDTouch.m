//
//  JSTableViewController+ThreeDTouch.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableViewController+ThreeDTouch.h"

@implementation JSTableViewController (ThreeDTouch)

/**
 *  peek手势
 */
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
 
        
        if (![self getShouldShowRectAndIndexPathWithLocation:location]) return nil;

        //坐标点的转化，
        CGPoint tableLocation = [self.view convertPoint:location toView:self.tableView];
        NSIndexPath * selectedPath = [self.tableView indexPathForRowAtPoint:tableLocation];
        CGFloat rowHeight=[self.delegate JSTableViewController:self heightForRowAtIndexPath:selectedPath];
        
        //弹出视图的初始位置，sourceRect是peek触发时的高亮区域。这个区域内的View会高亮显示，其余的会模糊掉
        CGRect sourceRect = CGRectMake(0, selectedPath.row * rowHeight, IPHONScreenHeight, rowHeight);
        previewingContext.sourceRect = sourceRect;

        return [self.delegate JSTableViewController:self previewingContext:previewingContext viewControllerForLocation:location];
     

    
    }


/**
 *  pop手势
 */
-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
  
    [self.delegate JSTableViewController:self popViewController:previewingContext commitViewController:viewControllerToCommit];

}

/**
 *  获取用户手势点所在cell的下标，同时判断手势点是否超出tableview的范围
 */

- (BOOL)getShouldShowRectAndIndexPathWithLocation:(CGPoint)location {
    //坐标点的转化，
    CGPoint tableLocation = [self.view convertPoint:location toView:self.tableView];
    NSIndexPath* selectedPath = [self.tableView indexPathForRowAtPoint:tableLocation];
    
    // 如果row越界了，返回NO 不处理peek手势
    NSLog(@"当前所在的行---%zd",selectedPath.row);
    return (selectedPath.row >= (self.data.count+10)) ? NO : YES;
    
    
}



@end
