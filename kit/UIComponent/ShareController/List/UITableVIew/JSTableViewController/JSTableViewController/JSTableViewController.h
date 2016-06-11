//
//  SWTableViewController.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MJRefresh.h"
#import "JSListViewEmptyView.h"
#import "JSStretchableTableHeaderView.h"


@protocol JSTableViewControllerDelegate;
@protocol JSTableViewCellDelegate;
@protocol JSTableScrollViewDelegate;


typedef enum {
    /** 普通列表 */
    JSTableViewNormal = 1,
    /** 显示上拉 */
    JSTableViewPullHeader=2,
    /** 显示下拉 */
    JSTableViewPullFooter=3,
    /** 显示上下拉 */
    JSTableViewPullHeaderFooter=4
} JSTableViewState;

static NSString *const KSWIdentifier=@"JSTableViewController";



/*

tableview 集成功能（暂时不考虑分组）

①： 集成自定义tableViewHeader 和 tableViewFooter (v)

②： 集成自定义Cell，并且赋值即可 （协议） (v)

③： 集成MJ(v)

④： 集成空View (v)

⑤： 集成上拉弹簧 (v)

 */

@protocol JSTableViewControllerDelegate,JSSectionTableViewDelegate,JSTableScrollViewDelegate,JSTableView3DTouchDelegate,JSTableViewHeadFooterDelegate;

@interface JSTableViewController : UIViewController<UIViewControllerPreviewingDelegate,UITableViewDelegate,UITableViewDataSource>

#pragma mark -分组相关属性


@property(nonatomic,strong)NSMutableArray *sections;//分组

@property(nonatomic,strong)NSMutableDictionary<NSString *,NSArray *> *rowsOfSectionDic;//组对应列


#pragma mark -共用属性

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,assign)NSInteger pageIndex;//页码


@property(nonatomic,strong)NSMutableArray *data;//数据源

@property(nonatomic,assign)UITableViewCellSeparatorStyle separatorStyle;

@property(nonatomic,weak)id<JSTableViewControllerDelegate> delegate;//代理

@property(nonatomic,weak)id<JSTableViewCellDelegate> JSTableViewCellDelegate;//cell代理方法


#pragma mark - 是否每次进入页面加载一次网络请求
@property(nonatomic,assign)BOOL IsEveryLoading;// 是否只加载一次;



#pragma mark - 头部是否拉伸 HFStretchableTableHeaderView
@property(nonatomic,strong) JSStretchableTableHeaderView *stretchHeaderView;



//初始化方法
-(instancetype)initWithStyle:(UITableViewStyle)style state:(JSTableViewState)state tableViewCellClass:(Class) cellclass delegate:(id<JSTableViewControllerDelegate>)delegate;

#pragma mark -注册3DTouch 功能

@property(nonatomic,assign)BOOL isEnable3DTouch;


@end












