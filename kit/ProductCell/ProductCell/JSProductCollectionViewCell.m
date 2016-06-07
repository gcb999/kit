//
//  JSProductViewCell.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductCollectionViewCell.h"


#define KJSProductCollectionPadding 5

@interface JSProductCollectionViewCell ()



@property(nonatomic,strong)JSProductCollectionViewCellFrameModel *frameModel;

@end


@implementation JSProductCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       

        //设置背景
      
        self.bgImgView.layer.borderWidth=0.5f;
        self.bgImgView.layer.borderColor=KborderColor.CGColor;
        
        //闪购
        self.product_flashGo_label.textAlignment=NSTextAlignmentCenter;
        
        //soldOut
        self.product_SoldOut_Imgview.image=[UIImage imageNamed:@"SOLD"];
      
        //编辑与buy
        self.editBtn=[[JSDIYButton alloc] initWithFrame:CGRectZero];
        [self.editBtn setImage:[UIImage imageNamed:@"nav_cart_Green"] forState:UIControlStateNormal];
        [self.editBtn setTitle:@"Edit" forState:UIControlStateNormal];
        self.editBtn.layer.cornerRadius=4;
        self.editBtn.backgroundColor=rgb(236, 236, 236);
        [self.editBtn addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgImgView addSubview:self.editBtn];
        
        self.buyBtn=[[JSDIYButton alloc] initWithFrame:CGRectZero];
        [self.buyBtn setImage:[UIImage imageNamed:@"nav_cart_Green"] forState:UIControlStateNormal];
        [self.buyBtn setTitle:@"buy" forState:UIControlStateNormal];
        self.buyBtn.layer.cornerRadius=4;
        self.buyBtn.backgroundColor=rgb(236, 236, 236);
        [self.buyBtn addTarget:self action:@selector(buy:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgImgView addSubview:self.buyBtn];
        
    
        
        
        
    
        
        
    }
    return self;
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    
    [super JSCollectionViewController:JSCtrl collectionViewDateArr:dateArr cellValue:date indexPath:indexpath];
    
    self.frameModel=JSCtrl.data[indexpath.row];


#pragma mark - 1:闪购
    [self setFlashGo];
    
}



#pragma mark -赋值
-(void)setFlashGo{
    
    
    //服务器记录时间
    NSDate *severDate=[self.frameModel.model.product_flashGo_Time dateFromString];
    if (self.frameModel.model.is_FlashGo) {//是闪购商品
        NSDate *nowDate=[NSDate date];
        long  tempcounttime=[severDate timeIntervalSinceDate:nowDate];//现在时间-服务器记录时间
        if(tempcounttime>0){//正常时间
            
            NSInteger seconds = tempcounttime% 60;
            NSInteger minutes = (tempcounttime / 60) % 60;
            NSInteger hours = (tempcounttime / 3600);
            NSString *timeString = [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld", (long)hours, (long)minutes, (long)seconds];
            self.product_flashGo_label.text=timeString;
            
            
            
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:timeString];
  
            
            
            //字型
            [string addAttribute:NSFontAttributeName value:KNormalFontSize range:NSMakeRange(0, 2)];
            
            [string addAttribute:NSFontAttributeName value:KNormalFontSize range:NSMakeRange(3, 2)];
            
             [string addAttribute:NSFontAttributeName value:KNormalFontSize range:NSMakeRange(6, 2)];
            
            //顏色

            
            [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, 2)];
            
            [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(3, 2)];
            
             [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(6, 2)];
            
            //背景顏色
             [string addAttribute:NSBackgroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 2)];
             
             [string addAttribute:NSBackgroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(3, 2)];
            
             [string addAttribute:NSBackgroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(6, 2)];
            
             self.product_flashGo_label.attributedText=string;

            
        }
        else{//超时,重新请求服务器
            
            
        }
        
    }
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    CGRect  rect=self.contentView.bounds;
    
    [self.frameModel layoutSubFrame:rect];
    
    self.editBtn.frame=self.frameModel.edit_Frame;
    self.buyBtn.frame=self.frameModel.buy_Frame;

    
}




-(void)edit:(UIButton *)btn{
    
    
}

-(void)buy:(UIButton *)btn{
    
    
}





@end
