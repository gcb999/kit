//
//  LeftViewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/23.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftTableViewCell.h"



@interface LeftViewController()<JSTableViewControllerDelegate>{
    
}

@end

@implementation LeftViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
   
    [self addBackBtn];
    CGRect  rect =self.view.bounds;
    
    //initWithState:JSTableViewNormal tableViewCellClass:[LeftTableViewCell class] delegate:self
    JSTableViewController *ctrl=[[JSTableViewController alloc] initWithStyle:UITableViewStylePlain state:JSTableViewNormal tableViewCellClass:[LeftTableViewCell class] delegate:self];
    ctrl.view.frame=rect;
    
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
    
}


-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    NSArray *date=@[@"Home",@"Account",@"Cart",@"WishList",@"Favorite Stores",@"Message",@"MyInvitations",@"My Coupons",
                    ];
    NSArray *date1=@[@"Setting",@"Currency Converter",@"App Suggestion",@"Customer Serviece",@"About Us"];
    
    [JSCtrl.data addObjectsFromArray:date];
      [JSCtrl.data addObjectsFromArray:date1];
    [JSCtrl reloadHeader];
    
}

#pragma mark -初始化头部

-(UIView *)JSTableViewControllerWithViewForTableHeaderView{
    
    CGRect hrect=CGRectMake(0, 0, IPHONScreenWidth, 120);
    UIView *vw=[[UIView alloc] initWithFrame:hrect];
    vw.backgroundColor=KCOLOR_RED;
    return vw;
}
#pragma mark -点击事件
-(void)JSTableViewController:(JSTableViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [[JSSideSlippingControllerConfig shareInstance] exitRootViewControllerForShowCenterPanel];
    
    
    NSInteger row=indexPath.row;
    if(row==0){
        
        
        
    }
    else if(row==1){
        
        
        
    }
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];


}
-(void)goback{
    [[JSSideSlippingControllerConfig shareInstance] showLeftPanel];
}


@end
