//
//  JSTableViewControllerDelegate.h
//  SailvanElec
//
//  Created by gcb999 on 16/6/4.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark ----------------------------------代理方法-----------------------------------------

@protocol JSTableViewControllerDelegate<JSSectionTableViewDelegate,JSTableScrollViewDelegate,JSTableView3DTouchDelegate,JSTableViewHeadFooterDelegate>


// 网络加载
-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage;

//点击事件
-(void)JSTableViewController:(JSTableViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


//高度
-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl heightForRowAtIndexPath:(NSIndexPath *)indexPath;





#pragma mark --------直接加头部和底部View-----------------

-(UIView *)JSTableViewControllerWithViewForTableFooterView ;
-(UIView *)JSTableViewControllerWithViewForTableHeaderView;


@end





#pragma mark - TableView分组代理方法

@protocol  JSSectionTableViewDelegate<NSObject>



-(NSInteger)JSTableViewController:(JSTableViewController *)JSCtrl  numberOfRowsInSection:(NSInteger)section;
//1:Cell
-(UITableViewCell *)JSTableViewController:(JSTableViewController *)JSCtrl cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end







#pragma mark -TableView头部与尾部
@protocol  JSTableViewHeadFooterDelegate<NSObject>

//1：头部
-(UIView *)JSTableViewController:(JSTableViewController *)JSCtrl viewForHeaderInSection:(NSInteger)section;
-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl  heightForHeaderInSection:(NSInteger)section;

//2：底部
-(UIView *)JSTableViewController:(JSTableViewController *)JSCtrl viewForFooterInSection:(NSInteger)section;
-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl  heightForFooterInSection:(NSInteger)section;

@end






#pragma mark -TableViewJSTableView3DTouchDelegate
@protocol  JSTableView3DTouchDelegate<NSObject>

//Peek

-(UIViewController *)JSTableViewController:(JSTableViewController *)JSCtrl  previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location;

//POP
-(void)JSTableViewController:(JSTableViewController *)JSCtrl  popViewController:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit;

@end





#pragma mark -TableViewJSTableView3DTouchDelegate
@protocol JSTableScrollViewDelegate <NSObject>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;                                               // any offset changes
- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2); // any zoom scale changes

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0);
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;   // called on finger up as we are moving
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;      // called when scroll view grinds to a halt

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView; // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;     // return a view that will be scaled. if delegate returns nil, nothing happens
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2); // called before the scroll view begins zooming its content
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale; // scale between minimum and maximum. called after any 'bounce' animations

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView;   // return a yes if you want to scroll to the top. if not defined, assumes YES
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView;      // called when scrolling animation finished. may be called immediately if already at top




@end
