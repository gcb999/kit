//
//  JSProductListCollectionViewCellModel.m
//  SailvanElec
//
//  Created by gcb999 on 16/6/1.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductListCollectionViewCellModel.h"

@implementation JSProductListCollectionViewCellModel

-(JSProductListCollectionViewCellModel *)initWithDic:(NSDictionary *)dic{
    
    if (self=[super init]) {
        
#pragma mark - 1:商品图片
        self.product_Url=@"http://img05.tooopen.com/images/20140506/sy_60405092566.jpg";
        
        
#pragma mark -2:左上角折扣/价格
        
        self.is_Discount=YES;
        self.product_Discount=@"-80%";
        
#pragma mark - 3: 标题
        self.product_Title=@"标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题";
        
        
#pragma mark - 4: color,size ,type
        self.product_Color=@"color:red";
        
        self.product_Size=@"size: xxlll";
        
        self.product_Type=@" type :ssss";
        
#pragma mark -5: 数量
        self.product_Quntity=@"qty;2";
        
        
#pragma mark - 6: 优惠价与原价
        self.product_Price=@"$80";
        self.product_DiscountPrice=@"$50";
        
        
#pragma mark -7：闪购时间和图片
        self.is_FlashGo=YES;
        self.product_flashGo_Time=@"2016-06-3 03:07:10";
        
#pragma mark -8:sold Out
        self.is_SoldOut=YES;
        
        
#pragma mark -9:免邮
        self.is_free_shipping=NO;
        
        self.is_edit_buy=YES;
        
        
        
        
        
        
    }
    return self;
    
    
}



@end
