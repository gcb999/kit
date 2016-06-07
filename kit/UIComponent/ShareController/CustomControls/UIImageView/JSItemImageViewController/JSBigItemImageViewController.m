//
//  JSBigItemImageViewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/25.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSBigItemImageViewController.h"
#import "JSItemImgageViewCell.h"
@interface JSBigItemImageViewController ()<JSCollectionViewControllerDelegate>
{
    
}


@property (nonatomic , strong) JSBaseFlowLayout *baseFlowLayOut;



@end

@implementation JSBigItemImageViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor blackColor];
    

    
    //1: 页码控件
    [self.view addSubview:self.pageLb];
    
    
    //2： add colleciontionView
    [self.view addSubview:self.collectionViewController.view];
    [self addChildViewController:self.collectionViewController];
    self.collectionViewController.collectionView.backgroundColor=[UIColor blackColor];
    
    
    //3:  添加PageController
    [self.view addSubview:self.pageControl];
    
    
    
    
}

#pragma mark -加载数据源
-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    [self.collectionViewController.data addObjectsFromArray:self.bigImgUrl];
    self.pageControl.numberOfPages=self.bigImgUrl.count;
    //默认设置页码
    [self currentPage:1];
    [self.collectionViewController reloadHeader];
    
}

#pragma mark -点击事件

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark -滚动事件 UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = scrollView.contentOffset.x / IPHONScreenWidth;
    NSInteger currentPage= self.pageControl.currentPage + 1;
    [self currentPage:currentPage];
    
}



#pragma mark -设置标题大小

-(void)currentPage:(NSInteger)currentPage {
    
    
    NSString * str = [NSString stringWithFormat:@"%ld/%ld",currentPage,self.collectionViewController.data.count];
    NSArray * array = [str componentsSeparatedByString:@"/"];
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc]initWithString:str];
    NSString * string1 = array[0];
    NSString * string2 = array[1];
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, string1.length)];
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(string1.length, string2.length)];
    self.pageLb.attributedText = string;

}


#pragma mark -页码头部控件

- (UILabel *)pageLb
{
    if (_pageLb == nil) {
        _pageLb = [[UILabel alloc]initWithFrame:CGRectZero];
        _pageLb.textColor = [UIColor whiteColor];
        _pageLb.textAlignment = NSTextAlignmentCenter;
        _pageLb.font = KSmallFontSize;
    }
    return _pageLb;
}


#pragma mark -列表控件

-(JSCollectionViewController *)collectionViewController{
    if(_collectionViewController==nil){
        _collectionViewController =[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[JSItemImgageViewCell class] delegate:self];
       
        _collectionViewController.pagingEnabled=YES;
         _collectionViewController.view.tag=2;
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
    
    CGRect hrect, rect =self.view.bounds;
    
   
    
    //1：页码
    CGRectDivide(rect, &hrect, &rect, 50, CGRectMinYEdge);
    self.pageLb.frame= hrect;
    
    
    //2:设置CollectionView坐标
    CGFloat height=rect.size.height-50;
    CGRectDivide(rect, &hrect, &rect, height, CGRectMinYEdge);
    self.collectionViewController.view.frame=hrect;
    
    //3: 设置PageController坐标
   
    _pageControl.frame=rect;

    
    //3： 添加流水布局
    CGRect collectViewRect=self.collectionViewController.view.frame;
    JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithContentFrame:collectViewRect DirectionHorizontal:collectViewRect.size minimumLineSpacing:0];
    self.collectionViewController.flowLayout=flowout;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden=NO;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
