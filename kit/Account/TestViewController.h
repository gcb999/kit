//
//  TestViewController.h
//  kit
//
//  Created by gcb999 on 16/6/11.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) JSCollectionViewController *collectionViewController;
@end
