//
//  JSItemImageViewController.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/25.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSItemImageViewController : UIViewController



- (instancetype)initWithFrame:(CGRect)frame smallImgUrl:(NSArray *)smallImgUrls bigImgUrl:(NSArray *)bigImgUrls;



@property (nonatomic , strong) UIPageControl *pageControl;
@property (nonatomic , strong) JSCollectionViewController *collectionViewController;


@end
