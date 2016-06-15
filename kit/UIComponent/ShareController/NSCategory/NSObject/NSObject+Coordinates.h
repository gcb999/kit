//
//  NSObject+Coordinates.h
//  kit
//
//  Created by gcb999 on 16/6/15.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Coordinates)

/*
 1: rect --父类的坐标
 2：size ===子类大小
 作用获取子类相对于父类居中坐标
 */
-(CGRect)centerForParentViewFrame:(CGRect)rect subsize:(CGSize) size;

@end
