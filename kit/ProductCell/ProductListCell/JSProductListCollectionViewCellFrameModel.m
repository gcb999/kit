//
//  JSProductListCollectionViewCellFrameModel.m
//  SailvanElec
//
//  Created by gcb999 on 16/6/1.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductListCollectionViewCellFrameModel.h"

#define KJSProductListPadding 5

@implementation JSProductListCollectionViewCellFrameModel


-(JSProductListCollectionViewCellFrameModel *)initWithDic:(NSDictionary *)dic{
    
    if (self=[super init]) {
        
        self.model=[[JSProductListCollectionViewCellModel alloc] initWithDic:dic];
        [self layoutRowHeight:self.model];
        
        
    }
    return self;
    
    
}

-(void)layoutSubFrame:(CGRect)rect{
    
     [super layoutSubFrame:rect];
    
    CGRect hrect,lrect;
    
#pragma mark -左边
    
#pragma mark - 1:商品图片
    self.product_Url_ImgView_Frame=CGRectMake(0, 0, 120, 120);
    
    
#pragma mark -2:左上角折扣/价格
    if(self.model.is_Discount){
        
        self.product_Discount_ImgView_Frame=CGRectMake(0, 0, 40, 40);
        self.product_Discount_Label_Frame=CGRectMake(0, 0, 28, 28);
        
    }
    else{
        self.product_Discount_ImgView_Frame=CGRectZero;
        self.product_Discount_Label_Frame=CGRectZero;
    }
    
    
    
#pragma mark -右边
    CGFloat width=self.product_Url_ImgView_Frame.size.width;
    CGRectDivide(rect, &lrect, &rect,width , CGRectMinXEdge);
    rect=UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(0, 5, 0, 5));
    
#pragma mark - 3: 标题
    CGRectDivide(rect, &hrect, &rect, 40, CGRectMinYEdge);
    self.product_Title_Frame=hrect;
    
    self.rowHeight+=40;
    
    
#pragma mark - 4: color,size ,type
    
    if(IS_NSString(self.model.product_Color)){
        CGRectDivide(rect, &hrect, &rect, 20, CGRectMinYEdge);
        self.product_Color_Frame=hrect;
        
        self.rowHeight+=20;
    }
    else{
        self.product_Color_Frame=CGRectZero;
    }
    
    
    //size
    if(IS_NSString(self.model.product_Size)){
        CGRectDivide(rect, &hrect, &rect, 20, CGRectMinYEdge);
        self.product_Size_Frame=hrect;
        self.rowHeight+=20;
    }
    else{
        self.product_Size_Frame=CGRectZero;
    }
    
    //type
    if(IS_NSString(self.model.product_Type)){
        CGRectDivide(rect, &hrect, &rect, 20, CGRectMinYEdge);
        self.product_Type_Frame=hrect;
        self.rowHeight+=20;
    }
    else{
        self.product_Type_Frame=CGRectZero;
    }
    
#pragma mark -5: 数量
    if (IS_NSString(self.model.product_Quntity)) {
        CGRectDivide(rect, &hrect, &rect, 20, CGRectMinYEdge);
        self.product_Quntity_Frame=hrect;
        self.rowHeight+=20;
    }
    else{
        self.product_Quntity_Frame=CGRectZero;
    }

    
#pragma mark - 6: 优惠价与原价
    if (!IS_NSString(self.model.product_DiscountPrice)) {//特价为空
        
        
        self.product_Price_Frame=CGRectZero;//原价
        self.product_DiscountPrice_Frame=CGRectZero;//折扣价
        
    }
    else{//---
        
        CGRectDivide(rect, &hrect, &rect, 20, CGRectMinYEdge);
        self.rowHeight+=20;
        if(!IS_NSString(self.model.product_Price)  || [self.model.product_DiscountPrice isEqualToString:self.model.product_Price]){//只显示特价
            
            self.product_Price_Frame=CGRectZero;//原价
            self.product_DiscountPrice_Frame=hrect;//折扣价
            
        }
        else{
            
            CGRect priceRect;
            
            
            CGRectDivide(hrect, &priceRect, &hrect, 40, CGRectMinXEdge);
            
            self.product_Price_Frame=UIEdgeInsetsInsetRect(priceRect, UIEdgeInsetsMake(0, 0, 0, KJSProductListPadding));//原价
            self.product_DiscountPrice_Frame=UIEdgeInsetsInsetRect(hrect, UIEdgeInsetsMake(0, KJSProductListPadding, 0, 0));//折扣价
        }
        
    }
    
#pragma mark -7：闪购时间和图片 图片大小 30*30
    if (self.model.is_FlashGo) {
        CGRectDivide(rect, &hrect, &rect, 30, CGRectMinYEdge);
        CGRect flashgoRect;
        CGRectDivide(hrect, &flashgoRect, &hrect, 30, CGRectMinXEdge);
        self.product_flashGo_ImgView_Frame=flashgoRect;
        self.product_flashGo_Lable_Frame=UIEdgeInsetsInsetRect(hrect, UIEdgeInsetsMake(0, KJSProductListPadding, 0, 0));
        
        self.rowHeight+=30;
        
        
    }
    else{
        self.product_flashGo_ImgView_Frame=CGRectZero;
        self.product_flashGo_Lable_Frame=CGRectZero;
        
    }
#pragma mark -8:免邮 图片大小 30*30
    if(self.model.is_free_shipping){
        
        CGRectDivide(rect, &hrect, &rect, 30, CGRectMinYEdge);
        CGRect freeshippingRect;
        CGRectDivide(hrect, &freeshippingRect, &hrect, 30, CGRectMinXEdge);
        self.product_freeshipping_Frame=freeshippingRect;
        
        self.rowHeight+=30;
        
    }
    else{
        self.product_freeshipping_Frame=CGRectZero;
    }
    
#pragma mark -9:sold Out 图片大小 30*30
    if (self.model.is_SoldOut) {
        
        CGRectDivide(rect, &hrect, &rect, 30, CGRectMinYEdge);
        CGRect soldOutRect;
        CGRectDivide(hrect, &soldOutRect, &hrect, 30, CGRectMinXEdge);
        self.product_SoldOut_ImgView_Frame=soldOutRect;
        
        self.rowHeight+=30;
        
    }
    else{
        self.product_SoldOut_ImgView_Frame=CGRectZero;
        
    }
    
    //edit,Buy
    
    if (self.model.is_edit_buy) {
        
        CGRectDivide(rect, &hrect, &rect, 40, CGRectMinYEdge);
        self.rowHeight+=40;
        
        CGRect edit_buy_Rect;
        CGFloat width=hrect.size.width*0.5f;
        CGRectDivide(hrect, &edit_buy_Rect, &hrect,80,CGRectMinXEdge);
        _edit_Frame=UIEdgeInsetsInsetRect(edit_buy_Rect, UIEdgeInsetsMake(0, 0, 0, 2));//编辑
        _buy_Frame=UIEdgeInsetsInsetRect(hrect, UIEdgeInsetsMake(0, 0, 0, 0));//buy
        
    }
    else{
        _edit_Frame=CGRectZero;
        _buy_Frame=CGRectZero;
    }
 
    

#pragma mark -10： 最后判断图片的高度与商品图片的高度进行比较
    
    if (self.rowHeight<=self.product_Url_ImgView_Frame.size.height) {
        self.rowHeight=self.product_Url_ImgView_Frame.size.height+5;
    }
    
#pragma mark -11： 线
    
    //间距
    CGRectDivide(rect, &hrect, &rect, 10, CGRectMinYEdge);
    self.rowHeight+=5;
    
    //设置线坐标
    self.product_line_Frame=CGRectMake(0,self.rowHeight, IPHONScreenWidth,1 );

    #pragma mark -12：最好加入适当高度
    self.rowHeight+=5;

}

@end
