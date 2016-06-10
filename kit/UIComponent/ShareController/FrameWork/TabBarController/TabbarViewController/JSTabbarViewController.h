//
//  JSTabbarViewController.h
//  kit
//
//  Created by gcb999 on 16/6/8.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSTabbar.h"

@interface JSTabbarViewController : UIViewController<UINavigationControllerDelegate>

@property(nonatomic,strong)UIView *contentView;

@property(nonatomic,strong)JSTabbar *tabbar;



@end
