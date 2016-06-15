//
//  AcountViewController.m
//  UIComponent
//
//  Created by gcb999 on 16/6/6.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "AcountViewController.h"
#import "TestViewController.h"

@interface AcountViewController ()<JSTableViewControllerDelegate>
{

}
@property(nonatomic,strong)JSTableViewController *tableViewController;

@end

@implementation AcountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.view addSubview:self.tableViewController.view];
    [self addChildViewController:self.tableViewController];
    
    UIImageView *avater = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
    avater.image = [UIImage imageNamed:@"avater"];
    avater.center = CGPointMake(IPHONScreenWidth*0.5f, 100);
    
    
   [self.tableViewController stretchHeaderImgUrl:@"photo.jpg" subViews:avater];
    
    
    [self ShyNavBar:self.tableViewController.tableView];
    
    
}

#pragma mark - JSTableViewController Delegate

//1：加载数据源
-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
   
    
    for(int i=0;i<20;i++){
    
    JSSelectedTableViewCellModel *model=[[JSSelectedTableViewCellModel alloc] init];
    model.title=@"张三";
    model.iconUrl=@"photo";
    JSSelectedTableViewCellModelFrame *modelFrame=[[JSSelectedTableViewCellModelFrame alloc]initWithUpAndDownModel:model];

  
        [self.tableViewController.data addObject:modelFrame];
    }
//    [self.tableViewController.data addObjectsFromArray:[JSSimpleTableViewCellModelSingleHelper shareInstance].singleTableViewModel];
    if (currentPage==1) {
        [self.tableViewController reloadHeader];
    }
    else{
        [self.tableViewController reloadFooter];
    }
   

}




//2：点击事件
-(void)JSTableViewController:(JSTableViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 

    JSSelectedTableViewCellModelFrame *modelFrame=self.tableViewController.data[indexPath.row];
    modelFrame.model.flag=YES;
    [self.tableViewController reloadHeader];
//    UIViewController *ctrl=(UIViewController *)[[NSClassFromString(model.ctrl) alloc] init];
//    if (ctrl) {
//        [self.navigationController pushViewController:ctrl animated:YES];
//    }
    
}


-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    JSSelectedTableViewCellModelFrame *model=self.tableViewController.data[indexPath.row];
    return model.rowHeight;
}


#pragma mark -getter

-(JSTableViewController *)tableViewController{
    if (_tableViewController==nil) {
        _tableViewController=[[JSTableViewController alloc] initWithStyle:UITableViewStylePlain state:JSTableViewPullHeaderFooter tableViewCellClass:[JSSelectedTableViewCell class] delegate:self];
        _tableViewController.view.frame=self.view.bounds;
    }
    return _tableViewController;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"---dd");
    
}




@end
