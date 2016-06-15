//
//  JSSelectedTableViewCellModelFrame.h
//  kit
//
//  Created by gcb999 on 16/6/15.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "JSSelectedTableViewCellModel.h"

#define  KHorizontallyRowHeight 50

#define  KUpAndDownModelRowHeight 50

@interface JSSelectedTableViewCellModelFrame : NSObject

@property (nonatomic , assign,readonly) CGRect bgImageView_Frame;

@property (nonatomic , assign,readonly) CGRect iconImageView_Frame;

@property (nonatomic , assign,readonly) CGRect titleLabel_Frame;

@property (nonatomic , assign,readonly) CGRect selelctedImageView_Frame;

@property (nonatomic , assign,readonly) CGFloat rowHeight;

@property(nonatomic,strong)JSSelectedTableViewCellModel *model;

#pragma mark -------------------- 横排布局--------------------

-(instancetype)initWithHorizontallyModel:(JSSelectedTableViewCellModel *)model;

#pragma mark --------------------上下布局 Up and down--------------------

-(instancetype)initWithUpAndDownModel:(JSSelectedTableViewCellModel *)model;


@end
