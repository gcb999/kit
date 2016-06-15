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
{
    CGFloat offsety;
    BOOL flag;
}

@property(nonatomic,strong) JSCollectionViewController *collectionViewController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    [self.view addSubview:self.collectionViewController.view];
    [self addChildViewController:self.collectionViewController];
    JSBaseFlowLayout *flowOut=[[JSBaseFlowLayout alloc] initWithDirectionVertical:2 itemHeight:250];
    self.collectionViewController.flowLayout=flowOut;
    
    
    [ self ShyNavBar:self.collectionViewController.collectionView];
    

    

}
#pragma mark -getter

-(JSCollectionViewController *)collectionViewController{
    if (_collectionViewController==nil) {
        _collectionViewController=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[JSProductCollectionCell class] delegate:self HeaderViewType:[HeadBannerReusableView class]];
        _collectionViewController.view.frame=self.view.bounds;
    }
    return _collectionViewController;
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    

     HomeDetailViewController *ctrl=[[HomeDetailViewController alloc] init];

    
    //        self.navigationController.delegate=self.transition;
    [self.navigationController pushViewController:ctrl animated:YES];

    
}



#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    

    if (currentPage==1 ||currentPage==2) {
        if (currentPage==1) {
            [SWCtrl.data removeAllObjects];
        }
        
        for (int i=0; i<20; i++) {
            
            JSProductCollectionCellModel *model=[[JSProductCollectionCellModel alloc] init];
#pragma mark - 1：闪购
            model.is_FlashGo=YES;
            
            model.product_flashGo_Time=@"2016-06-5 03:07:10";
            
            
#pragma mark - 2:商品图片
            model.product_Url=@"http://img05.tooopen.com/images/20140506/sy_60405092566.jpg";
            
            
#pragma mark 3:sold Out
            model.is_SoldOut=YES;
            
            
#pragma mark -4:左上角折扣/价格
            model.is_Discount=YES;
            model.product_Discount=@"-80%";
            
            
            
            //标题
            model.product_Title=@"标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试";
            
            
            
            //原件和特价
            
            model.product_Price=@"$80";
            model.product_DiscountPrice=@"$50";
            
            //edit buy
//            model.is_edit_buy=YES;
            
            
            //卖光
            model.is_SoldOut=YES;
            

            JSProductDetailCollectionCellModelFrame *frameModel=[[JSProductDetailCollectionCellModelFrame alloc] initWithProductModel:model];
                                                               
                                                               
                        [SWCtrl.data addObject:frameModel];
        }
        
        if (currentPage==1) {
                [SWCtrl reloadHeader];
        }
        else{
            [SWCtrl reloadFooter];
        }
    
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


}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
   //1；隐藏底部
    CGFloat y=self.collectionViewController.collectionView.contentOffset.y;
    NSLog(@"--y=%f",y);
    if (self.collectionViewController.collectionView.contentOffset.y<IPHONScreenHeight-100) {//隐藏
        [JSTabBarControllerConfig shareInstance].tabBarController.tabBar.hidden = NO;
    }
    else{//隐藏
            [JSTabBarControllerConfig shareInstance].tabBarController.tabBar.hidden = YES;

    }
    
    
}



@end
