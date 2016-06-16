//
//  PlaceOrderCollectionCellModelFrame.h
//  kit
//
//  Created by gcb999 on 16/6/16.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductBasisCollectionCellModelFrame.h"
#import "JSPlaceOrderCollectionCellModel.h"

@interface JSPlaceOrderCollectionCellModelFrame : JSProductBasisCollectionCellModelFrame

-(instancetype)initWithModel:(JSPlaceOrderCollectionCellModel *)model;
#pragma mark -实体
@property(nonatomic,strong)JSPlaceOrderCollectionCellModel *model;


@end
