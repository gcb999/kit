//
//  JSTabbarViewController.h
//  kit
//
//  Created by gcb999 on 16/6/8.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSTabbar.h"

@interface JSTabbarViewController : UIViewController

@property(nonatomic,strong)UIView *contentView;

@property(nonatomic,strong)JSTabbar *tabbar;

@property (nonatomic, readwrite, copy) NSArray<UIViewController *> *viewControllers;

/*!
 * The Attributes of items which is displayed on the tab bar.
 */
@property (nonatomic, readwrite, copy) NSArray<NSDictionary *> *tabBarItemsAttributes;


@end
