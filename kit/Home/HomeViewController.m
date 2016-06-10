//
//  HomeViewController.m
//  kit
//
//  Created by gcb999 on 16/6/7.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "HomeViewController.h"
#import "JSProductCollectionViewCell.h"
#import "HomeDetailViewController.h"
#import "AcountViewController.h"
@interface HomeViewController ()<JSCollectionViewControllerDelegate,JSWaterFlowLayoutDelegate>


@property(nonatomic,strong) JSCollectionViewController *collectionViewController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionViewController.view];
    [self addChildViewController:self.collectionViewController];
    JSBaseFlowLayout *flowOut=[[JSBaseFlowLayout alloc] initWithDirectionVertical:2 itemHeight:250];
    self.collectionViewController.flowLayout=flowOut;
    
//   self.shyNavBarManager.scrollView = self.collectionViewController.collectionView;
    
 
    

    

}
#pragma mark -getter

-(JSCollectionViewController *)collectionViewController{
    if (_collectionViewController==nil) {
        _collectionViewController=[[JSCollectionViewController alloc] initWithState:JSCollectionViewPullHeaderFooter CollectionViewCellClass:[JSProductCollectionViewCell class] delegate:self HeaderViewType:[HeadBannerReusableView class]];
        _collectionViewController.view.frame=self.view.bounds;
    }
    return _collectionViewController;
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
          [[JSTabbarViewController shareInstance] showBadge:@"50" tabbarIndex:2 Animation:NO];
    }
    else if (indexPath.row==1){
         [[JSTabbarViewController shareInstance] showBadge:@"50" tabbarIndex:2 Animation:YES];
    }
    else if (indexPath.row==2){
         [[JSTabbarViewController shareInstance] showBadge:@"100" tabbarIndex:2 Animation:YES];
    }
    else if (indexPath.row==3){

        
    }
    

     AcountViewController *ctrl=[[AcountViewController alloc] init];

    
    //        self.navigationController.delegate=self.transition;
    [self.navigationController pushViewController:ctrl animated:YES];

    
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


#pragma mark -显示数目
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [[JSTabbarViewController shareInstance] showBadge:@"10" tabbarIndex:2 Animation:NO];

}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
   //1；隐藏底部
    if (self.collectionViewController.collectionView.contentOffset.y<IPHONScreenHeight-80) {//隐藏
        [[JSTabbarViewController shareInstance] showTabbar];
    }
    else{//显示
        [[JSTabbarViewController shareInstance] hiddenTabbar];
        
    }
    
    
}



@end
