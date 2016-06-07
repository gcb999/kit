//
//  JSBigItemImageViewController.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/25.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSBigItemImageViewController : UIViewController

@property(nonatomic,strong)NSArray *bigImgUrl;

@property (nonatomic , strong) UIPageControl *pageControl;
@property (nonatomic , strong) JSCollectionViewController *collectionViewController;
@property (nonatomic , strong) UILabel *pageLb;


@end
