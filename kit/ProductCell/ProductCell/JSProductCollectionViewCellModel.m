//
//  JSProductCollectionViewCellModel.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/31.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductCollectionViewCellModel.h"

@implementation JSProductCollectionViewCellModel

-(JSProductCollectionViewCellModel *)initWithDic:(NSDictionary *)dic{
    
    if (self=[super init]) {
    
#pragma mark - 1：闪购
        self.is_FlashGo=YES;
        
        self.product_flashGo_Time=@"2016-06-5 03:07:10";
        
        
#pragma mark - 2:商品图片
        self.product_Url=@"http://img05.tooopen.com/images/20140506/sy_60405092566.jpg";
       
        
#pragma mark 3:sold Out
        self.is_SoldOut=YES;
        
        
#pragma mark -4:左上角折扣/价格
        self.is_Discount=YES;
        self.product_Discount=@"-80%";
        

  
        //标题
        self.product_Title=@"标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试标题测试";
        

        
        //原件和特价
        
        self.product_Price=@"$80";
        self.product_DiscountPrice=@"$50";
        
        //edit buy
        self.is_edit_buy=YES;
        
        
        //卖光
        self.is_SoldOut=YES;
        
   
        
        
        
        

        
    }
    return self;
    
    
}


@end
