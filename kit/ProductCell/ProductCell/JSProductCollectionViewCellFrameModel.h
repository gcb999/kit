//
//  JSProductCollectionViewCellFrameModel.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/31.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSBaseProductCollectionCellFrameModel.h"
#import "JSProductCollectionViewCellModel.h"
#import "JSBaseProductCollectionCellFrameModel+Layout.h"

@interface JSProductCollectionViewCellFrameModel : JSBaseProductCollectionCellFrameModel




#pragma mark -  Edit和Buy
@property(nonatomic ,assign,readonly) CGRect edit_Frame;

@property(nonatomic ,assign,readonly) CGRect buy_Frame;





@property(nonatomic,strong)JSProductCollectionViewCellModel *model;


-(JSProductCollectionViewCellFrameModel *)initWithDic:(NSDictionary *)dic;



@end
