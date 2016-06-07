//
//  AcountViewController.m
//  UIComponent
//
//  Created by gcb999 on 16/6/6.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "AcountViewController.h"
#import "AccountCell.h"
#import "MJExtension.h"

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
    
    
//    [self.tableViewController stretchHeaderImgUrl:@"photo.jpg" subViews:avater];
    
    
    self.shyNavBarManager.scrollView=self.tableViewController.tableView;
    
    
}

#pragma mark - JSTableViewController Delegate

//1：加载数据源
-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
   
    
   NSString *content= [self readBundleFileName:@"AccontContent.json"];
    NSDictionary *dic= [content JSONObject];
    if (IS_NSDictionary(dic)) {
        NSArray *tempArr=dic[@"content"];
        if (IS_NSArray(tempArr)) {
            for (NSDictionary *dic in tempArr) {
                 AccountModel *model = [AccountModel objectWithKeyValues:dic];

                [self.tableViewController.data addObject:model];
            }
             [self.tableViewController reloadHeader];
        }
    }
    
   

}


//2：点击事件
-(void)JSTableViewController:(JSTableViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    AccountModel *model=self.tableViewController.data[indexPath.row];
    UIViewController *ctrl=(UIViewController *)[[NSClassFromString(model.ctrl) alloc] init];
    if (ctrl) {
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    
}





#pragma mark -getter

-(JSTableViewController *)tableViewController{
    if (_tableViewController==nil) {
        _tableViewController=[[JSTableViewController alloc] initWithStyle:UITableViewStylePlain state:JSTableViewNormal tableViewCellClass:[AccountCell class] delegate:self];
        _tableViewController.view.frame=self.view.bounds;
    }
    return _tableViewController;
}





@end
