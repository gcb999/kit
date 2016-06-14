//
//  TestViewController.m
//  kit
//
//  Created by gcb999 on 16/6/11.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "TestViewController.h"
#import "JSProductCollectionViewCell.h"
#import "HeadBannerReusableView.h"

@implementation TestViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITableView *tableview= [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.delegate=self;
    tableview.dataSource=self;
    tableview.frame=CGRectMake(0, 0, IPHONScreenWidth, self.view.bounds.size.height);
    tableview.rowHeight=80;
    [self.view addSubview:tableview];
//    [self ShyNavBar:tableview];
    

   


    
    
}

//#pragma mark -getter
//
//-(JSCollectionViewController *)collectionViewController{
//    if (_collectionViewController==nil) {
//        _collectionViewController=[[JSCollectionViewController alloc] initWithState:JSCollectionViewPullHeaderFooter CollectionViewCellClass:[JSProductCollectionViewCell class] delegate:self HeaderViewType:[HeadBannerReusableView class]];
//        _collectionViewController.view.frame=self.view.bounds;
//    }
//    return _collectionViewController;
//}
//
//#pragma mark -实现网络请求数据
//
//-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
//    
//    
//    if (currentPage==1) {
//        [SWCtrl.data removeAllObjects];
//        for (int i=0; i<20; i++) {
//            JSProductCollectionViewCellFrameModel *frameModel=[[JSProductCollectionViewCellFrameModel alloc] initWithDic:@{}];
//            [SWCtrl.data addObject:frameModel];
//        }
//        
//        
//        [SWCtrl reloadHeader];
//    }
//    else if (currentPage==2){
//        for (int i=0; i<20; i++) {
//            JSProductCollectionViewCellFrameModel *frameModel=[[JSProductCollectionViewCellFrameModel alloc] initWithDic:@{}];
//            [SWCtrl.data addObject:frameModel];
//        }
//        [SWCtrl reloadFooter];
//        
//        
//    }
//    else{
//        
//        [SWCtrl.data removeAllObjects];
//        [SWCtrl reloadFooter];
//    }
//    
//    
//    
//    
//}
//
//-(CGSize)JSCollectionViewController:(JSCollectionViewController *)JSCtrl layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    
//    return CGSizeMake(IPHONScreenWidth, 200);
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil)
    {
        // Create a cell to display an ingredient.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:showUserInfoCellIdentifier];
        
    }
    
    // Configure the cell.
    cell.textLabel.text=@"签名";
    return cell;
}


@end
