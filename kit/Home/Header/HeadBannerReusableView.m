//
//  HeadBannerReusableView.m
//  kit
//
//  Created by gcb999 on 16/6/7.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "HeadBannerReusableView.h"

@implementation HeadBannerReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    

        [self addSubview:self.cycleScrollView];
        
   
        
        
    }
    return self;
}

#pragma mark -getter
-(SDCycleScrollView *)cycleScrollView{
    if (_cycleScrollView==nil) {
        // 网络加载 --- 创建带标题的图片轮播器
        _cycleScrollView=[SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
            _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色

    }
    return _cycleScrollView;
}


-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl   collectionViewDateArr:(NSArray *)dateArr indexPath:(NSIndexPath *)indexpath{
    
    NSInteger row=indexpath.row;
    NSArray *imagesURLStrings = @[];
    if (JSCtrl.view.tag==1) {
        imagesURLStrings = @[
                             @"http://images.cnitblog.com/blog/215975/201405/311744526507841.png",
                             @"http://pic.cnblogs.com/avatar/291306/20150909092523.png"
                        
                             ];
            JSCtrl.view.tag=0;
    }
    else{
        
        imagesURLStrings = @[
                             @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                             @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                             @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                             ];
        JSCtrl.view.tag=1;
    }
    
    

    
//     self.cycleScrollView.titlesGroup = @[@"标题1",@"标题2",@"标题3"];
      self.cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    
}



@end
