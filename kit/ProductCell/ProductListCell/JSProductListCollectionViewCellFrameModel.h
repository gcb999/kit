//
//  JSProductListCollectionViewCellFrameModel.h
//  SailvanElec
//
//  Created by gcb999 on 16/6/1.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSProductListCollectionViewCellModel.h"
#import "JSBaseProductCollectionCellFrameModel+Layout.h"
#import "JSBaseProductCollectionCellFrameModel.h"

@interface JSProductListCollectionViewCellFrameModel : JSBaseProductCollectionCellFrameModel






#pragma mark - Edit和Buy
@property(nonatomic ,assign) CGRect edit_Frame;

@property(nonatomic ,assign) CGRect buy_Frame;


#pragma mark - 线
@property(nonatomic ,assign) CGRect product_line_Frame;



@property(nonatomic,strong)JSProductListCollectionViewCellModel *model;


-(JSProductListCollectionViewCellFrameModel *)initWithDic:(NSDictionary *)dic;







@end
