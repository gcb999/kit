//
//  SWTableViewController.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableViewController.h"


@interface JSTableViewController ()
{
    JSTableViewState _state;
    BOOL _isFirstLoadPage;//是否第一进入页面
    Class _cellClass;
    UITableViewStyle _style;
}
@end

@implementation JSTableViewController


-(instancetype)initWithStyle:(UITableViewStyle)style state:(JSTableViewState)state tableViewCellClass:(Class) cellclass delegate:(id<JSTableViewControllerDelegate>)delegate{
    if (self=[super init]) {
        self.data=[NSMutableArray array];
        _state=state;
        _cellClass=cellclass;
        _style=style;
        self.delegate=delegate;
      
    }
    return self;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    self.tableView=[UITableView TableViewWithFrame:self.view.bounds style:_style backgroundColor:rgb(234, 234, 234) delegate:self separatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
    if (_style==UITableViewStyleGrouped) {
        
           self.tableView.backgroundColor=rgb(234, 234, 234);
    }
    else{
     
        self.tableView.backgroundColor=[UIColor whiteColor];
    }
    [self.view addSubview:self.tableView];
    [self setUpMJRefresh:_state];
    [self setUpTableHeaderView];
    [self setUpTableFooterView];
    _isFirstLoadPage=YES;
    if (_cellClass) {
        [self.tableView registerClass:_cellClass forCellReuseIdentifier:KSWIdentifier];
    }
  

    
  
      self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.showsVerticalScrollIndicator = NO;


  
}



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if(_isFirstLoadPage==YES){//第一次进入界面
        
        self.pageIndex=1;
        
        
        if ([self.tableView.header respondsToSelector:@selector(beginRefreshing)]) {
            [self.tableView.header beginRefreshing];
        }
        else{
            [self loadNewData];
            
        }
        _isFirstLoadPage=NO;
        
    }
    else{//再次进入界面
        
        if (self.IsEveryLoading) {
            if ([self.tableView.header respondsToSelector:@selector(beginRefreshing)]) {
                [self.tableView.header beginRefreshing];
            }
            else{
                [self loadNewData];
                
            }
        }
        
        
    }
  
    //集成3DTouch功能
    if (self.isEnable3DTouch) {
        if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
            
            [self registerForPreviewingWithDelegate:self sourceView:self.view];
            
            NSLog(@"3D Touch  可用!");
            
        }else{
            
            NSLog(@"3D Touch 无效");
        }
        
    }
    
}















@end
