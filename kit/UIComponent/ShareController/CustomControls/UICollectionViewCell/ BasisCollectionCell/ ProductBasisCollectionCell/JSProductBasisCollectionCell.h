//
//  JSProductBasisCollectionCell.h
//  kit
//
//  Created by gcb999 on 16/6/16.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSProductBasisCollectionCellModelFrame.h"

@interface JSProductBasisCollectionCell : UICollectionViewCell<JSCollectionViewControllerDelegate>


#pragma mark - 背景图
@property(nonatomic ,strong)UIImageView *bgImgView;

#pragma mark - 商品图片
@property(nonatomic ,strong)UIImageView *product_Url_ImgView;


#pragma mark -左上角折扣/价格
@property(nonatomic,strong)UIImageView *product_Discount_ImgView;
@property(nonatomic,strong)UILabel *product_Discount_Lable;


#pragma mark - 标题
@property(nonatomic,strong)UILabel *product_Title_Lable;


#pragma mark -  color,size ,type
@property(nonatomic,strong)UILabel *product_Color_Lable;
@property(nonatomic,strong)UILabel *product_Size_Lable;
@property(nonatomic,strong)UILabel *product_Type_Lable;


#pragma mark - 数量
@property(nonatomic,strong)UILabel *product_Quntity_Lable;


#pragma mark -  优惠价与原价
@property(nonatomic ,strong)UILabel *product_Price_Label;
@property(nonatomic ,strong)UILabel *product_DiscountPrice_Label;


#pragma mark -闪购时间和图片
@property(nonatomic,strong)UIImageView *product_flashGo_ImgView;
@property(nonatomic,strong)UILabel *product_flashGo_label;


#pragma mark -免邮
@property(nonatomic,strong)UIImageView *product_Free_Imgview;

#pragma mark -sold Out
@property(nonatomic,strong)UIImageView *product_SoldOut_Imgview;


#pragma mark -line
@property(nonatomic,strong)UIImageView *product_line_ImgView;

#pragma mark -ModelFrame
@property(nonatomic,strong)JSProductBasisCollectionCellModelFrame *baseModelFrame ;

@end
