//
//  JSItemImageViewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/25.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSItemImageViewController.h"
#import "JSItemImgageViewCell.h"
#import "JSBigItemImageViewController.h"


@interface JSItemImageViewController ()<JSCollectionViewControllerDelegate>
{
    
    
}


@property(nonatomic,strong)NSArray *smallImgUrls;

@property(nonatomic,strong)NSArray *bigImgUrls;


@property (nonatomic , strong) JSBaseFlowLayout *baseFlowLayOut;

@property(nonnull ,strong)JSPresentTransformScaleTransition *transition;

@end

@implementation JSItemImageViewController


- (instancetype)initWithSmallImgUrl:(NSArray *)smallImgUrls bigImgUrl:(NSArray *)bigImgUrls
{
    self = [super init];
    if (self) {
       
        self.smallImgUrls=smallImgUrls;
        self.bigImgUrls=bigImgUrls;
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    



    
    //1： add colleciontionView
    [self.view addSubview:self.collectionViewController.view];
    [self addChildViewController:self.collectionViewController];
    
    
    
    //2:  添加PageController
    [self.collectionViewController.view addSubview:self.pageControl];
    
    
   
 
}

#pragma mark -加载数据源
-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    [self.collectionViewController.data addObjectsFromArray:self.smallImgUrls];
    self.pageControl.numberOfPages=self.smallImgUrls.count;
    [self.collectionViewController reloadHeader];
    
}

#pragma mark -点击事件

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JSBigItemImageViewController *ctrl=[[JSBigItemImageViewController alloc] init];
    ctrl.bigImgUrl=self.bigImgUrls;
    
    self.transition=[[JSPresentTransformScaleTransition alloc] initWithPresented:^(UIViewController *presented, UIViewController *presenting, UIViewController *source, HYBBaseTransition *transition) {
        
    } dismissed:^(UIViewController *dismissed, HYBBaseTransition *transition) {
         self.transition.transitionMode = kHYBTransitionDismiss;
    }];
    
//     vc.modalPresentationStyle = UIModalPresentationCustom;
     ctrl.transitioningDelegate = self.transition;
   
    [self presentViewController:ctrl animated:YES completion:^{
        
    }];
    
    
    
}


#pragma mark -滚动事件 UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = scrollView.contentOffset.x / IPHONScreenWidth;
}



#pragma mark -列表控件

-(JSCollectionViewController *)collectionViewController{
    if(_collectionViewController==nil){
     _collectionViewController =[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[JSItemImgageViewCell class] delegate:self];
      
        _collectionViewController.pagingEnabled=YES;
        _collectionViewController.view.tag=1;
      
        
    }
    
    return _collectionViewController;
}



#pragma mark -页码控件
- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {

        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectZero];
        
            }
    return _pageControl;
}



-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    //1：CollectionView
    self.collectionViewController.view.frame=self.view.bounds;
    
    //2: 页码
    CGSize size=self.view.bounds.size;
    self.pageControl.frame= CGRectMake(0, size.height-20, size.width, 20);
    
    
    
    //3： 添加流水布局
    CGRect collectViewRect=self.collectionViewController.view.frame;
    JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithContentFrame:collectViewRect DirectionHorizontal:collectViewRect.size minimumLineSpacing:0];
    self.collectionViewController.flowLayout=flowout;

}

@end
