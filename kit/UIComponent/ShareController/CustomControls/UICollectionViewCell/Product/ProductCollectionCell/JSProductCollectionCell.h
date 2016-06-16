//
//  JSProductListCollectionCell.h
//  kit
//
//  Created by gcb999 on 16/6/16.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductBasisCollectionCell.h"
#import "JSProductCollectionCellModelFrame.h"


@interface JSProductCollectionCell : JSProductBasisCollectionCell

#pragma mark - 1: Edit和Buy

@property(nonatomic,strong)JSDIYButton *editBtn;
@property(nonatomic,strong)JSDIYButton *buyBtn;

@property(nonatomic,strong)JSProductCollectionCellModelFrame *modelFrame;

@end
