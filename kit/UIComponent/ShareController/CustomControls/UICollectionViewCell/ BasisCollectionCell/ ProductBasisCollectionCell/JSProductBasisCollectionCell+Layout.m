//
//  JSProductBasisCollectionCell+Layout.m
//  kit
//
//  Created by gcb999 on 16/6/16.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductBasisCollectionCell+Layout.h"

@implementation JSProductBasisCollectionCell (Layout)

-(void)layoutSubFrame:(CGRect)rect {
    
 #pragma mark - pragma mark - 背景图坐标
    self.bgImgView.frame=rect;
    
    

    
#pragma mark - 商品图片坐标
    
    self.product_Url_ImgView.frame=self.baseModelFrame.product_Url_ImgView_Frame;
    
#pragma mark -左上角折扣/价格
    //折扣图片
    self.product_Discount_ImgView.frame=self.baseModelFrame.product_Discount_ImgView_Frame;;
    
    //折扣文字
    self.product_Discount_Lable.frame=self.baseModelFrame.product_Discount_Label_Frame;
    self.product_Discount_Lable.transform=CGAffineTransformMakeRotation(-M_PI/4);//必须加入
    
    
    
#pragma mark - 3: 标题
    self.product_Title_Lable.frame=self.baseModelFrame.product_Title_Frame;
    
    
#pragma mark - 4: color,size ,type
    self.product_Color_Lable.frame=self.baseModelFrame.product_Color_Frame;
    self.product_Type_Lable.frame=self.baseModelFrame.product_Size_Frame;
    self.product_Size_Lable.frame=self.baseModelFrame.product_Type_Frame;
    
    
#pragma mark -5: 数量
    self.product_Quntity_Lable.frame=self.baseModelFrame.product_Quntity_Frame;
    
    
#pragma mark - 6: 优惠价与原价
    self.product_Price_Label.frame=self.baseModelFrame.product_Price_Frame;
    self.product_DiscountPrice_Label.frame=self.baseModelFrame.product_DiscountPrice_Frame;
    
    
    
#pragma mark -7：闪购时间和图片
    self.product_flashGo_ImgView.frame=self.baseModelFrame.product_flashGo_ImgView_Frame;
    self.product_flashGo_label.frame=self.baseModelFrame.product_flashGo_Lable_Frame;
    
    
    
#pragma mark -8:免邮
    self.product_Free_Imgview.frame=self.baseModelFrame.product_freeshipping_Frame;
    
    
#pragma mark -9:sold Out
    self.product_SoldOut_Imgview.frame=self.baseModelFrame.product_SoldOut_ImgView_Frame;
    
    
#pragma mark -10 line
    self.product_line_ImgView.frame=self.baseModelFrame.product_line_Frame;
    
}

@end
