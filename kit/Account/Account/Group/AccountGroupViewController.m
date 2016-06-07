//
//  AccountGroupViewController.m
//  UIComponent
//
//  Created by gcb999 on 16/6/6.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "AccountGroupViewController.h"

#import "AccountCell.h"

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
    
    NSString *content= [self readBundleFileName:@"AccontGroupContent.json"];
    NSDictionary *contentDic= [content JSONObject];
    if (IS_NSDictionary(contentDic)) {
        NSArray *contentArr=contentDic[@"content"];
        if (IS_NSArray(contentArr)) {
            for (NSDictionary *dic in contentArr) {
                //key
                NSString *key=[[dic allKeys] lastObject];
                //数组
                NSMutableArray *valuesArray=[NSMutableArray array];
                
                NSArray *values=dic[key];
                for (NSDictionary *tempDic in values) {
                    AccountModel *model = [AccountModel objectWithKeyValues:tempDic];
                    [valuesArray addObject:model];
                }
                
                
                [self.tableGroupViewController.rowsOfSectionDic addEntriesFromDictionary:@{key:valuesArray}];
            }
           [self.tableGroupViewController reloadHeader];
        }
    }
    

    
   
    
  }


//2：点击事件
-(void)JSTableViewController:(JSTableViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    else{
        return 12;
    }
}



-(void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
  
}

#pragma mark -getter

-(JSTableGroupViewController *)tableGroupViewController{
    if (_tableGroupViewController==nil) {
        _tableGroupViewController=[[JSTableGroupViewController alloc] initWithStyle:UITableViewStyleGrouped state:JSTableViewNormal tableViewCellClass:[AccountCell class] delegate:self];
    
        _tableGroupViewController.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    }
    return _tableGroupViewController;
}


@end
