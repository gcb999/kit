//
//  JSProductBasisCollectionCell.m
//  kit
//
//  Created by gcb999 on 16/6/16.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductBasisCollectionCell.h"


@interface JSProductBasisCollectionCell ()
{
    
}

@end

@implementation JSProductBasisCollectionCell

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
    
    self.baseModelFrame=JSCtrl.data[indexpath.row];
    [self assignValue:self.baseModelFrame];
    
}





-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect rect =self.contentView.bounds;
    
    //调用父类
    [self.baseModelFrame layoutSubFrame:rect];
    
    [self layoutSubFrame:rect];

    

    
    
}




@end
