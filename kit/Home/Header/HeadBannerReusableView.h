//
//  HeadBannerReusableView.h
//  kit
//
//  Created by gcb999 on 16/6/7.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadBannerReusableView : UICollectionReusableView<JSCollectionViewHeaderFooterDelegate,SDCycleScrollViewDelegate>

@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;

@end
