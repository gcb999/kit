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
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionViewController.view];
    [self addChildViewController:self.collectionViewController];
    JSBaseFlowLayout *flowOut=[[JSBaseFlowLayout alloc] initWithDirectionVertical:2 itemHeight:250];
    self.collectionViewController.flowLayout=flowOut;
    
    //   self.shyNavBarManager.scrollView = self.collectionViewController.collectionView;
    
    [ self ShyNavBar:self.collectionViewController.collectionView];
    

   


    
    
}

#pragma mark -getter

-(JSCollectionViewController *)collectionViewController{
    if (_collectionViewController==nil) {
        _collectionViewController=[[JSCollectionViewController alloc] initWithState:JSCollectionViewPullHeaderFooter CollectionViewCellClass:[JSProductCollectionViewCell class] delegate:self HeaderViewType:[HeadBannerReusableView class]];
        _collectionViewController.view.frame=self.view.bounds;
    }
    return _collectionViewController;
}

#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    
    if (currentPage==1) {
        [SWCtrl.data removeAllObjects];
        for (int i=0; i<20; i++) {
            JSProductCollectionViewCellFrameModel *frameModel=[[JSProductCollectionViewCellFrameModel alloc] initWithDic:@{}];
            [SWCtrl.data addObject:frameModel];
        }
        
        
        [SWCtrl reloadHeader];
    }
    else if (currentPage==2){
        for (int i=0; i<20; i++) {
            JSProductCollectionViewCellFrameModel *frameModel=[[JSProductCollectionViewCellFrameModel alloc] initWithDic:@{}];
            [SWCtrl.data addObject:frameModel];
        }
        [SWCtrl reloadFooter];
        
        
    }
    else{
        
        [SWCtrl.data removeAllObjects];
        [SWCtrl reloadFooter];
    }
    
    
    
    
}

-(CGSize)JSCollectionViewController:(JSCollectionViewController *)JSCtrl layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(IPHONScreenWidth, 200);
}


//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 100;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
//    if (cell == nil)
//    {
//        // Create a cell to display an ingredient.
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
//                                      reuseIdentifier:showUserInfoCellIdentifier];
//        
//    }
//    
//    // Configure the cell.
//    cell.textLabel.text=@"签名";
//    return cell;
//}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

   //1；隐藏底部
    CGFloat y=self.collectionViewController.collectionView.contentOffset.y;
    NSLog(@"--y=%f",y);
    if (self.collectionViewController.collectionView.contentOffset.y<IPHONScreenHeight-100) {//隐藏
        [[JSTabbarViewController shareInstance] showTabbar];
    }
    else{//显示
        [[JSTabbarViewController shareInstance] hiddenTabbar];



    }


}


@end
