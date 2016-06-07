//
//  JSTabBarControllerConfigModel.h
//  UIComponent
//
//  Created by gcb999 on 16/6/6.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSTabBarControllerConfigModel : NSObject


@property(nonatomic,copy)NSString *title;//标题

@property(nonatomic,copy)NSString *normalImage;//正常图片

@property(nonatomic,copy)NSString *selectedImage;//选中图片

@property(nonatomic,copy)NSString *ctrl;//控制器

@property(nonatomic,assign)BOOL flag;//标识,临时作用

@end
