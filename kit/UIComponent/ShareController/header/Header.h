//
//  Header.h
//  ProgramDemo
//
//  Created by zy on 13-11-18.
//  Copyright (c) 2013年 zy. All rights reserved.
//

#ifndef ProgramDemo_Header_h
#define ProgramDemo_Header_h








#define PAYPALENVIRON_TYPE 0

#if PAYPALENVIRON_TYPE ==0

#define PAYPALENVIRONMENT PayPalEnvironmentSandbox//测试

#elif PAYPALENVIRON_TYPE==1

#define PAYPALENVIRONMENT PayPalEnvironmentProduction//正式

#else

#define PAYPALENVIRONMENT PayPalEnvironmentNoNetwork//无网

#endif


#import <UIKit/UIKit.h>



#import "JSShareControllerHeader.h"


//宏头文件
#import "MacroHeader.h"










#define DLURL @""



//FB
#define FBAPPLINK @"https://fb.me/831925016915934"




//商品详情图片空间

#import "JSItemImageViewController.h"

#pragma mark -----------自定义商品Cell--------------------

/*

一：JSBaseProductCollectionCell用法
 
A: 先继承 JSBaseProductCollectionCell
 
B： 调用[super JSCollectionViewController:JSCtrl collectionViewDateArr:dateArr cellValue:date indexPath:indexpath];

 
二：JSBaseProductCollectionCellFrameModel
 
 
A: 重写Cell的高度
 -(void)layoutRowHeight:(JSBaseProductCollectionCellModel *)frameModel;
 
B: 重新算Cell坐标
 -(void)layoutSubFrame:(CGRect)rect ;
 
 
 */



#endif

