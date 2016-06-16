//
//  JSProductListCollectionCell.h
//  kit
//
//  Created by gcb999 on 16/6/16.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductBasisCollectionCell.h"
#import "JSProductListCollectionCellModelFrame.h"
#import "JSDIYButton.h"

@interface JSProductListCollectionCell : JSProductBasisCollectionCell
#pragma mark -  Edit和Buy
@property(nonatomic,strong)JSDIYButton *editBtn;
@property(nonatomic,strong)JSDIYButton *buyBtn;

@property(nonatomic,strong)JSProductListCollectionCellModelFrame *modelFrame;

@end
