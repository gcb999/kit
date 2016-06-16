//
//  JSProductBasisCollectionCell+AssignValue.m
//  kit
//
//  Created by gcb999 on 16/6/16.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductBasisCollectionCell+AssignValue.h"

@implementation JSProductBasisCollectionCell (AssignValue)

#pragma mark -左边坐标布局

-(void)assignValue:(JSProductBasisCollectionCellModelFrame *)modelFrame{
    
    self.baseModelFrame=modelFrame;
    JSProductBasisCollectionCellModel *model=modelFrame.baseModel;
    
#pragma mark - 商品图片
    [self loadingSmallPlaceholderImageName:model.product_Url imgview:self.product_Url_ImgView];
    
    
 #pragma mark -左上角折扣/价格
    self.product_Discount_Lable.text=model.product_Discount;
    
    
#pragma mark - 标题
    self.product_Title_Lable.text=model.product_Title;
    
    
#pragma mark - color,size ,type
    self.product_Color_Lable.text=model.product_Color;
    self.product_Size_Lable.text=model.product_Size;
    self.product_Type_Lable.text=model.product_Type;
    
#pragma mark -数量
    self.product_Quntity_Lable.text=model.product_Quntity;
    
    
#pragma mark -  优惠价与原价
    NSMutableAttributedString *attr=[[NSMutableAttributedString alloc] init];
    if (IS_NSString(model.product_Price)) {
        self.product_Price_Label.attributedText= [attr attributedStringWithtitle:model.product_Price Font:KNormalFontSize color:[UIColor grayColor] isShowUnderlineStyle:NO isStrikethroughStyle:YES];
    }
    
    if (IS_NSString(model.product_DiscountPrice)) {
        
        self.product_DiscountPrice_Label.text=model.product_DiscountPrice;
    }

    
    
#pragma mark -闪购时间和图片
    //    self.product_flashGo_label.text=model.product_flashGo_Time;
    [self setFlashGo];
    
    
}


#pragma mark -闪购赋值
-(void)setFlashGo{
    
    
    //服务器记录时间
    NSDate *severDate=[self.baseModelFrame.baseModel.product_flashGo_Time dateFromString];
    if (self.baseModelFrame.baseModel.is_FlashGo) {//是闪购商品
        NSDate *nowDate=[NSDate date];
        long  tempcounttime=[severDate timeIntervalSinceDate:nowDate];//现在时间-服务器记录时间
        if(tempcounttime>0){//正常时间
            
            NSInteger seconds = tempcounttime% 60;
            NSInteger minutes = (tempcounttime / 60) % 60;
            NSInteger hours = (tempcounttime / 3600);
            NSString *timeString = [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld", (long)hours, (long)minutes, (long)seconds];
            self.product_flashGo_label.text=timeString;
            
        }
        else{//超时,重新请求服务器
            
            
        }
        
    }
}


@end
