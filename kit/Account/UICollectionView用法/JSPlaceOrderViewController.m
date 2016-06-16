//
//  JSPlaceOrderViewController.m
//  kit
//
//  Created by gcb999 on 16/6/16.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSPlaceOrderViewController.h"
#import "JSPlaceOrderCollectionCell.h"


@interface JSPlaceOrderViewController ()


@property(nonatomic,strong) JSCollectionViewController *collectionViewController;

@end

@implementation JSPlaceOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.collectionViewController.view];
    [self addChildViewController:self.collectionViewController];
    
    JSWaterFlowLayout *layout = [[JSWaterFlowLayout alloc]init];
    layout.delegate = self;
    self.collectionViewController.flowLayout=layout;
    
    
    [ self ShyNavBar:self.collectionViewController.collectionView];
    
    
    
    
}
#pragma mark -getter

-(JSCollectionViewController *)collectionViewController{
    if (_collectionViewController==nil) {
        _collectionViewController=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[JSPlaceOrderCollectionCell class] delegate:self];
        _collectionViewController.view.frame=self.view.bounds;
    }
    return _collectionViewController;
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}


#pragma mark -  流水布局的方法<CYXWaterFlowLayoutDelegate>

//设置每个Item高度
- (CGFloat)waterflowLayout:(JSWaterFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    JSPlaceOrderCollectionCellModelFrame *modelFrame= self.collectionViewController.data[index];
    return modelFrame.rowHeight;
}

- (CGFloat)rowMarginInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout
{
    return 10;
}

#pragma mark -设置一行几列
- (CGFloat)columnCountInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout
{
    return 1;
}
#pragma mark-设置 section
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    
    if (currentPage==1 ||currentPage==2) {
        if (currentPage==1) {
            [SWCtrl.data removeAllObjects];
        }
        
        for (int i=0; i<20; i++) {
            
            JSProductListCollectionCellModel *model=[[JSProductListCollectionCellModel alloc] init];
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
            
            model.is_edit_buy=YES;
            
            
            JSProductListCollectionCellModelFrame *frameModel=[[JSProductListCollectionCellModelFrame alloc] initWithModel:model];
            
            
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



@end
