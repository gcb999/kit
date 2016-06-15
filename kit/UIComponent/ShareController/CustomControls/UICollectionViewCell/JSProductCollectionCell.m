//
//  JSProductCollectionCell.m
//  kit
//
//  Created by gcb999 on 16/6/15.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//


#import "JSProductCollectionCell.h"

@interface JSProductCollectionCell (){
    
}
@property(nonatomic,strong)JSProductCollectionCellModelFrame *modelFrame ;

@end


@implementation JSProductCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
 

        
#pragma mark - 背景图
        self.bgImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        self.bgImgView.layer.borderWidth=0.5f;
        self.bgImgView.layer.borderColor=KborderColor.CGColor;
        [self.contentView addSubview: self.bgImgView];
        
        
#pragma mark - 商品图片
        self.product_Url_ImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        [ self.bgImgView addSubview:self.product_Url_ImgView];
        
        
#pragma mark -左上角折扣/价格
        
        //左上角 折扣图片
        CGSize size=CGSizeMake(40, 40);
        self.product_Discount_ImgView=[UIImageView ImageViewImageName:@"sclb_img_bq80x80_Green" frame:CGRectMake(0, 0, size.width, size.height)];
        self.product_Discount_ImgView.layer.cornerRadius=0;
        self.product_Discount_ImgView.layer.masksToBounds = YES;
        self.product_Discount_ImgView.clipsToBounds=YES;
        [self.product_Url_ImgView addSubview:self.product_Discount_ImgView];
        
        
        //左上角 折扣文字
        self.product_Discount_Lable=[UILabel LabWithFrame:CGRectMake(0, 0, 28, 28) text:@"-100%" textColor:[UIColor whiteColor] textAlign:NSTextAlignmentCenter  font:KSmallFontSize];
        self.product_Discount_Lable.adjustsFontSizeToFitWidth=YES;
        //        self.product_Discount_Lable.transform=CGAffineTransformMakeRotation(-M_PI/4);
        [self.product_Discount_ImgView addSubview:self.product_Discount_Lable];
        
        
#pragma mark -  标题
        self.product_Title_Lable=[UILabel LabWithFrame:CGRectZero text:@"商品标题" textColor:[UIColor blackColor] textAlign:NSTextAlignmentCenter  font:KNormalFontSize];
        self.product_Title_Lable.numberOfLines=2;
        [self.bgImgView addSubview:self.product_Title_Lable];
        
#pragma mark - color,size ,type
        
        self.product_Color_Lable=[UILabel LabWithFrame:CGRectZero text:@"Color:" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft  font:KNormalFontSize];
        [self.bgImgView addSubview:self.product_Color_Lable];
        
        self.product_Size_Lable=[UILabel LabWithFrame:CGRectZero text:@"Size:" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft  font:KNormalFontSize];
        [self.bgImgView addSubview:self.product_Size_Lable];
        
        self.product_Type_Lable=[UILabel LabWithFrame:CGRectZero text:@"Type" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft  font:KNormalFontSize];
        [self.bgImgView addSubview:self.product_Type_Lable];
        
#pragma mark -数量
        self.product_Quntity_Lable=[UILabel LabWithFrame:CGRectZero text:@"数量" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft  font:KNormalFontSize];
        [self.bgImgView addSubview:self.product_Quntity_Lable];
        
        
#pragma mark -优惠价与原价
        //原价
        self.product_Price_Label=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft font:KNormalFontSize];
        [ self.bgImgView addSubview:self.product_Price_Label];
        
        
        //特价
        self.product_DiscountPrice_Label=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft font:[UIFont boldSystemFontOfSize:16]];
        [ self.bgImgView addSubview:self.product_DiscountPrice_Label];
        
        
#pragma mark -闪购时间和图片
        
        //闪购 图片
        self.product_flashGo_ImgView=[UIImageView ImageViewImageName:@"ti" frame:CGRectZero];
        [self.bgImgView addSubview:self.product_flashGo_ImgView];
        
        //闪购 时间
        self.product_flashGo_label=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft font:KNormalFontSize];
        [self.bgImgView addSubview:self.product_flashGo_label];
        
        
        
        
        
        
        
#pragma mark -免邮
        self.product_Free_Imgview=[UIImageView ImageViewImageName:@"free_shipping_new" frame:CGRectZero];
        [self.bgImgView addSubview:self.product_Free_Imgview];
        
        
        
#pragma mark -sold Out
        self.product_SoldOut_Imgview=[UIImageView ImageViewImageName:@"sout" frame:CGRectZero];
        [self.bgImgView addSubview:self.product_SoldOut_Imgview];
       
        


        
#pragma mark -line

        self.product_line_ImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        self.product_line_ImgView.layer.borderColor=KborderColor.CGColor;
        self.product_line_ImgView.layer.borderWidth=0.5f;
        [self.bgImgView addSubview:self.product_line_ImgView];
        
        
        
        
    }
    return self;
}


-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    
    self.modelFrame=JSCtrl.data[indexpath.row];
    
    JSBaseProductCollectionCellModel *model =self.modelFrame.model;
    
#pragma mark - 商品图片
    [self loadingSmallPlaceholderImageName:model.product_Url imgview:self.product_Url_ImgView];
    
    
#pragma mark -左上角折扣/价格
    NSString *str=[NSString stringWithFormat:@"-%d%%",indexpath.row*8];
    self.product_Discount_Lable.text=str;//model.product_Discount;
    
    
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
    self.product_Price_Label.attributedText= [attr attributedStringWithtitle:model.product_Price Font:KNormalFontSize color:[UIColor grayColor] isShowUnderlineStyle:NO isStrikethroughStyle:YES];
    self.product_DiscountPrice_Label.text=model.product_DiscountPrice;
    
    
#pragma mark -闪购时间和图片
    //    self.product_flashGo_label.text=model.product_flashGo_Time;
    [self setFlashGo];
    
    
}


#pragma mark -闪购赋值
-(void)setFlashGo{
    
    
    //服务器记录时间
    NSDate *severDate=[self.modelFrame.model.product_flashGo_Time dateFromString];
    if (self.modelFrame.model.is_FlashGo) {//是闪购商品
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





-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect rect =self.contentView.bounds;

    
    [self.modelFrame layoutSubFrame:rect];
    
#pragma mark -左边坐标布局
    
#pragma mark - 背景图坐标
    self.bgImgView.frame=rect;
    
    
    
#pragma mark - 商品图片坐标
    
    self.product_Url_ImgView.frame=self.modelFrame.product_Url_ImgView_Frame;
    
#pragma mark -左上角折扣/价格
    //折扣图片
    self.product_Discount_ImgView.frame=self.modelFrame.product_Discount_ImgView_Frame;;
    
    //折扣文字
    self.product_Discount_Lable.frame=self.modelFrame.product_Discount_Label_Frame;
    self.product_Discount_Lable.transform=CGAffineTransformMakeRotation(-M_PI/4);//必须加入
    
    
#pragma mark -右边坐标布局
    
    
#pragma mark - 3: 标题
    self.product_Title_Lable.frame=self.modelFrame.product_Title_Frame;
    
    
#pragma mark - 4: color,size ,type
    self.product_Color_Lable.frame=self.modelFrame.product_Color_Frame;
    self.product_Type_Lable.frame=self.modelFrame.product_Size_Frame;
    self.product_Size_Lable.frame=self.modelFrame.product_Type_Frame;
    
    
#pragma mark -5: 数量
    self.product_Quntity_Lable.frame=self.modelFrame.product_Quntity_Frame;
    
    
#pragma mark - 6: 优惠价与原价
    self.product_Price_Label.frame=self.modelFrame.product_Price_Frame;
    self.product_DiscountPrice_Label.frame=self.modelFrame.product_DiscountPrice_Frame;
    
    
    
#pragma mark -7：闪购时间和图片
    self.product_flashGo_ImgView.frame=self.modelFrame.product_flashGo_ImgView_Frame;
    self.product_flashGo_label.frame=self.modelFrame.product_flashGo_Lable_Frame;
    
    
    
#pragma mark -8:免邮
    self.product_Free_Imgview.frame=self.modelFrame.product_freeshipping_Frame;
    
    
#pragma mark -9:sold Out
    self.product_SoldOut_Imgview.frame=self.modelFrame.product_SoldOut_ImgView_Frame;
    
    
#pragma mark -10 line
    self.product_line_ImgView.frame=self.modelFrame.product_line_Frame;
    
    
}

@end
