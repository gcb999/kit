//
//  AccountGroupViewController.m
//  UIComponent
//
//  Created by gcb999 on 16/6/6.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "AccountGroupViewController.h"



@interface AccountGroupViewController ()<JSTableViewControllerDelegate>
{
}
@property(nonatomic,strong)JSTableGroupViewController *tableGroupViewController;
@end


@implementation AccountGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.tableGroupViewController.view];
    [self addChildViewController:self.tableGroupViewController];
    
    UIImageView *avater = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
    avater.image = [UIImage imageNamed:@"avater"];
    avater.center = CGPointMake(IPHONScreenWidth*0.5f, 100);
    
    
    [self.tableGroupViewController stretchHeaderImgUrl:@"photo.jpg" subViews:avater];
    

    
    
    
}

#pragma mark - JSTableViewController Delegate

//1：加载数据源
-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
   NSDictionary<NSString *,NSArray<JSSimpleTableViewCellModel*> *>   *accountModels= [JSSimpleTableViewCellModelGroupHelper shareInstance].groupTableViewModels;
    
    [self.tableGroupViewController.sections addObjectsFromArray: accountModels.allKeys];
    self.tableGroupViewController.rowsOfSectionDic= [JSSimpleTableViewCellModelGroupHelper shareInstance].groupTableViewModels;
    [self.tableGroupViewController reloadHeader];

    
  }


//2：点击事件
-(void)JSTableViewController:(JSTableViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *text= self.tableGroupViewController.sections[indexPath.section];
    JSSimpleTableViewCellModel *model=self.tableGroupViewController.rowsOfSectionDic[text][indexPath.row];
    UIViewController *ctrl=(UIViewController *)[[NSClassFromString(model.ctrl) alloc] init];
    if (ctrl) {
        [self.navigationController pushViewController:ctrl animated:YES];
    }
}

-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    else{
        return 12;
    }
}




#pragma mark -getter

-(JSTableGroupViewController *)tableGroupViewController{
    if (_tableGroupViewController==nil) {
        _tableGroupViewController=[[JSTableGroupViewController alloc] initWithStyle:UITableViewStyleGrouped state:JSTableViewNormal tableViewCellClass:[JSSimpleTableViewCell class] delegate:self];
        _tableGroupViewController.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableGroupViewController.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    }
    return _tableGroupViewController;
}


@end
