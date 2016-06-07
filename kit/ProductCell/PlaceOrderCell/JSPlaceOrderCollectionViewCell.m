//
//  JSPlaceOrderCollectionViewCell.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSPlaceOrderCollectionViewCell.h"


@interface JSPlaceOrderCollectionViewCell ()

@property(nonatomic,strong)JSPlaceOrderCollectionViewCellFrameModel *frameModel;

@end

@implementation JSPlaceOrderCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
   
        
        self.lineImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        self.lineImgView.layer.borderColor=KborderColor.CGColor;
        self.lineImgView.layer.borderWidth=0.5f;
        [self.bgImgView addSubview:self.lineImgView];
        
        
        
        
        
    }
    return self;
}

#pragma mark -1：完成赋值即可

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    
    //1: 必须重写这个方法
    [super JSCollectionViewController:JSCtrl collectionViewDateArr:dateArr cellValue:date indexPath:indexpath];
  

}



#pragma mark -完成坐标赋值

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.lineImgView.frame=self.frameModel.product_line_Frame;
    
}



    
    






@end
