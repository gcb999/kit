//
//  JSProductCollectionCellModelFrame.h
//  kit
//
//  Created by gcb999 on 16/6/15.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSProductCollectionCellModel.h"

@protocol JSProductCollectionCellModelFrameDelegate <NSObject>

-(void)layoutSubFrame:(CGRect)rect;

@end


@interface JSProductCollectionCellModelFrame : NSObject


#pragma mark - 商品图片
@property(nonatomic ,assign) CGRect product_Url_ImgView_Frame;


#pragma mark -左上角折扣/价格
@property(nonatomic ,assign) CGRect product_Discount_ImgView_Frame;

@property(nonatomic ,assign) CGRect product_Discount_Label_Frame;


#pragma mark - 标题
@property(nonatomic ,assign) CGRect product_Title_Frame;


#pragma mark -  color,size ,type
@property(nonatomic ,assign) CGRect product_Color_Frame;

@property(nonatomic ,assign) CGRect product_Size_Frame;

@property(nonatomic ,assign) CGRect product_Type_Frame;

#pragma mark - 数量
@property(nonatomic ,assign) CGRect product_Quntity_Frame;


#pragma mark - 优惠价与原价
@property(nonatomic ,assign) CGRect product_Price_Frame;

@property(nonatomic ,assign) CGRect product_DiscountPrice_Frame;


#pragma mark -闪购时间和图片
@property(nonatomic ,assign) CGRect product_flashGo_ImgView_Frame;

@property(nonatomic ,assign) CGRect product_flashGo_Lable_Frame;


#pragma mark -免邮
@property(nonatomic,assign)CGRect product_freeshipping_Frame;//商品是否免邮

#pragma mark -sold Out

@property(nonatomic ,assign) CGRect product_SoldOut_ImgView_Frame;

@property(nonatomic ,assign) CGRect product_line_Frame;


//10; 行高
@property(nonatomic,assign)CGFloat rowHeight;

#pragma mark -实体
@property(nonatomic,strong)JSProductCollectionCellModel *model;


-(instancetype)initWithProductModel:(JSProductCollectionCellModel *)model;

-(void)layoutSubFrame:(CGRect)rect;


@end
