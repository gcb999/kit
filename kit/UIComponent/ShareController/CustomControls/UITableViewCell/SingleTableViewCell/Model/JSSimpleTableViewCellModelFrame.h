//
//  JSSimpleTableViewCellModelFrame.h
//  kit
//
//  Created by gcb999 on 16/6/15.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSSimpleTableViewCellModel.h"
#define KJSSimpleTableViewCellRowHeight 50

@interface JSSimpleTableViewCellModelFrame : NSObject

@property (nonatomic , assign,readonly) CGRect bgImageView_Frame;

@property (nonatomic , assign,readonly) CGRect iconImageView_Frame;

@property (nonatomic , assign,readonly) CGRect titleLabel_Frame;

@property (nonatomic , assign,readonly) CGRect jtImageView_Frame;

@property (nonatomic , assign,readonly) CGFloat rowHeight;

@property(nonatomic,strong)JSSimpleTableViewCellModel *model;

#pragma mark -------------------- 基本布局--------------------

-(instancetype)initWithModel:(JSSimpleTableViewCellModel *)model;




@end
