//
//  JSProductListCollectionCellModelFrame.h
//  kit
//
//  Created by gcb999 on 16/6/16.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductBasisCollectionCellModelFrame.h"
#import "JSProductListCollectionCellModel.h"

@interface JSProductListCollectionCellModelFrame : JSProductBasisCollectionCellModelFrame

#pragma mark - Edit和Buy
@property(nonatomic ,assign) CGRect edit_Frame;

@property(nonatomic ,assign) CGRect buy_Frame;


@property(nonatomic,strong)JSProductListCollectionCellModel *model;

-(instancetype)initWithModel:(JSProductListCollectionCellModel *)model;

@end
