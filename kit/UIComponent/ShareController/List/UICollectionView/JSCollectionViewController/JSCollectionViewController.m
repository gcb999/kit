//
//  SWCollectionViewController.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSCollectionViewController.h"


@interface JSCollectionViewController ()<UIViewControllerPreviewingDelegate>
{
    
    JSCollectionViewState _state;//MJ
    
    BOOL _isFirstLoadPage;//是否第一进入页面
    
    
}



@end

@implementation JSCollectionViewController

//正常
- (instancetype)initWithState:(JSCollectionViewState)state CollectionViewCellClass:(Class) cellclass delegate:(id<JSCollectionViewControllerDelegate>)delegate
{
    
        
        return  [self  initWithState:state CollectionViewCellClass:cellclass delegate:delegate HeaderViewType:nil footerViewClass:nil];
        

}

//头部

- (instancetype)initWithState:(JSCollectionViewState)state CollectionViewCellClass:(Class) cellclass delegate:(id<JSCollectionViewControllerDelegate>)delegate  HeaderViewType:(Class) headerViewClass
{

    return  [self  initWithState:state CollectionViewCellClass:cellclass delegate:delegate HeaderViewType:headerViewClass   footerViewClass:nil];
}


//底部
- (instancetype)initWithState:(JSCollectionViewState)state CollectionViewCellClass:(Class) cellclass delegate:(id<JSCollectionViewControllerDelegate>)delegate  footerViewClass:(Class) footerViewClass
{
    return  [self  initWithState:state CollectionViewCellClass:cellclass delegate:delegate HeaderViewType:nil footerViewClass:footerViewClass];
}

//头部和底部

- (instancetype)initWithState:(JSCollectionViewState)state CollectionViewCellClass:(Class) cellclass delegate:(id<JSCollectionViewControllerDelegate>)delegate  HeaderViewType:(Class) headerViewClass  footerViewClass:(Class) footerViewClass
{
    self = [super init];
    if (self) {
        self.data=[NSMutableArray array];
        _state=state;
      
        _collectionCellClass=cellclass;
        self.delegate=delegate;
        if (headerViewClass) {
             _headerViewClass=headerViewClass;
        }
        if (footerViewClass) {
            _footerViewClass=footerViewClass;
        }
     
        self.isEnable3DTouch=NO;
       
        
        
    }
    return self;
}





#pragma mark 设置流水瀑布




- (void)viewDidLoad {
    [super viewDidLoad];
   

    _isFirstLoadPage=YES;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.backgroundColor=KCOLOR_WHITE;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsHorizontalScrollIndicator=NO;
    

    _collectionView.pagingEnabled=self.pagingEnabled;
    _collectionView.scrollEnabled=YES;
    _collectionView.showsVerticalScrollIndicator=NO;
    
     [self setUpMJRefresh:_state];
    
    //cell
    
    [self.collectionView registerClass:self.collectionCellClass forCellWithReuseIdentifier:JSCollectionViewCellIdentifier];
    
    //头部
    if (self.headerViewClass) {
        [self.collectionView registerClass:self.headerViewClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:JSCollectionHeaderIdentifier];
        
    }
    else{
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:JSCollectionHeaderIdentifier];
        
    }
    
    //底部
    if (self.footerViewClass) {
        [self.collectionView registerClass:self.footerViewClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:JSCollectionFooterIdentifier];
    }
    else{
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:JSCollectionFooterIdentifier];
        
    }
    
    
    [self.view addSubview:_collectionView];
    
    
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews ];
    
    _collectionView.frame=self.view.bounds;
}

//切换布局
-(void)setFlowLayout:(UICollectionViewLayout *)flowLayout{
    
    [_collectionView setCollectionViewLayout:flowLayout animated:YES];
    
}



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if(_isFirstLoadPage==YES){//第一次进入界面
        
        self.pageIndex=1;
        
        
        if ([self.collectionView.header respondsToSelector:@selector(beginRefreshing)]) {
            [self.collectionView.header beginRefreshing];
        }
        else{
            [self loadNewData];
            
        }
        _isFirstLoadPage=NO;
        
    }
    else{//再次进入界面
        
        if (self.IsEveryLoading) {
            if ([self.collectionView.header respondsToSelector:@selector(beginRefreshing)]) {
                [self.collectionView.header beginRefreshing];
            }
            else{
                [self loadNewData];
                
            }
        }
        
        
    }
    //集成3DTouch功能
    if (self.isEnable3DTouch) {
        if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
            
            [self registerForPreviewingWithDelegate:self sourceView:self.view];
            
            NSLog(@"3D Touch  可用!");
            
        }else{
            
            NSLog(@"3D Touch 无效");
        }

    }

    

    
    
}

//#pragma mark - UIScrollViewDelegate
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    NSLog(@"----dd");
//}




@end

