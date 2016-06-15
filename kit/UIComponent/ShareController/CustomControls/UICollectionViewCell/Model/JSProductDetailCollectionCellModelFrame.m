//
//  JSProductDetailCollectionCellModelFrame.m
//  kit
//
//  Created by gcb999 on 16/6/15.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductDetailCollectionCellModelFrame.h"

@implementation JSProductDetailCollectionCellModelFrame


-(void)layoutSubFrame:(CGRect)rect{
    
    CGRect hrect;
    
    rect=UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(0, 2, 0, 2));
    //1: 闪购
    if(self.model.is_FlashGo){
        CGRectDivide(rect, &hrect, &rect, 30, CGRectMinYEdge);
        self.product_flashGo_Lable_Frame=hrect;
        self.rowHeight+=30;
    }
    
    
    //2: 大图
    CGRectDivide(rect, &hrect, &rect, 120, CGRectMinYEdge);
    self.product_Url_ImgView_Frame=hrect;
    self.rowHeight+=120;
    
    
    //3：soldOut
    
    if (self.model.is_SoldOut) {
        CGSize size=CGSizeMake(40, 40);
        CGFloat x=self.product_Url_ImgView_Frame.size.width-size.width;
        
        self.product_SoldOut_ImgView_Frame=CGRectMake(x,30 , size.width, size.height);
    }
    else{
        self.product_SoldOut_ImgView_Frame=CGRectZero;
    }
    
    
    //3:折扣图片 和文字
    if(self.model.is_Discount){
        
        self.product_Discount_ImgView_Frame=CGRectMake(0, 0, 40, 40);
        self.product_Discount_Label_Frame=CGRectMake(0, 0, 28, 28);
        
    }
    else{
        self.product_Discount_ImgView_Frame=CGRectZero;
        self.product_Discount_Label_Frame=CGRectZero;
    }
    
    
    
    
    
    //3: 标题
    if(IS_NSString(self.model.product_Title)){
        CGRectDivide(rect, &hrect, &rect, 35, CGRectMinYEdge);
        self.product_Title_Frame=hrect;
        self.rowHeight+=35;
        
    }
    else{
        self.product_Title_Frame=CGRectZero;
    }
    
    //4: 价格
    if (!IS_NSString(self.model.product_DiscountPrice)) {//特价为空
        
        
        self.product_Price_Frame=CGRectZero;//原价
        self.product_DiscountPrice_Frame=CGRectZero;//折扣价
        
    }
    else{
        CGRectDivide(rect, &hrect, &rect, 20, CGRectMinYEdge);
        self.rowHeight+=20;
        if(!IS_NSString(self.model.product_Price)  || [self.model.product_DiscountPrice isEqualToString:self.model.product_Price]){//只显示特价
            
            self.product_Price_Frame=CGRectZero;//原价
            self.product_DiscountPrice_Frame=hrect;//折扣价
            
            
        }
        else{
            
            CGRect priceRect;
            CGFloat width=hrect.size.width*0.5f;
            CGRectDivide(hrect, &priceRect, &hrect,width,CGRectMinXEdge);
            self.product_Price_Frame=UIEdgeInsetsInsetRect(priceRect, UIEdgeInsetsMake(0, 0, 0, 5));//原价
            self.product_DiscountPrice_Frame=UIEdgeInsetsInsetRect(hrect, UIEdgeInsetsMake(0, 0, 0, 0));//折扣价
            
        }
        
    }
    
    //edit,Buy
    
    //    if (self.model.is_edit_buy) {
    //
    //        CGRectDivide(rect, &hrect, &rect, 40, CGRectMinYEdge);
    //        self.rowHeight+=40;
    //
    //        CGRect edit_buy_Rect;
    //        CGFloat width=hrect.size.width*0.5f;
    //        CGRectDivide(hrect, &edit_buy_Rect, &hrect,width,CGRectMinXEdge);
    //        _edit_Frame=UIEdgeInsetsInsetRect(edit_buy_Rect, UIEdgeInsetsMake(0, 0, 0, 2));//编辑
    //        _buy_Frame=UIEdgeInsetsInsetRect(hrect, UIEdgeInsetsMake(0, 0, 0, 0));//buy
    //
    //    }
    //    else{
    //        _edit_Frame=CGRectZero;
    //        _buy_Frame=CGRectZero;
    //    }
    
    
    //最好加一点高度
    self.rowHeight+=5;
}
@end
