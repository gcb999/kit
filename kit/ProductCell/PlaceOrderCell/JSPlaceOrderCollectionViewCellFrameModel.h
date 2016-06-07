//
//  JSPlaceOrderCollectionViewCell_FrameModel.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  assign,readonlyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSPlaceOrderCollectionViewCellModel.h"
#import "JSBaseProductCollectionCellFrameModel.h"
#import "JSBaseProductCollectionCellFrameModel+Layout.h"

@interface JSPlaceOrderCollectionViewCellFrameModel : JSBaseProductCollectionCellFrameModel


#pragma mark - 初始化
-(instancetype)initWithDic:(NSDictionary *)dic;


#pragma mark -实体
@property(nonatomic,strong)JSPlaceOrderCollectionViewCellModel *model;

#pragma mark-UI坐标

@property(nonatomic ,assign) CGRect product_line_Frame;



@end
