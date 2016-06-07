//
//  JSProductListCollectionViewCell.m
//  SailvanElec
//
//  Created by gcb999 on 16/6/1.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductListCollectionViewCell.h"


@interface JSProductListCollectionViewCell ()

@property(nonatomic,strong)JSProductListCollectionViewCellFrameModel *frameModel;

@end

@implementation JSProductListCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
         
#pragma mark - Edit和Buy
        
        self.editBtn=[[JSDIYButton alloc] initWithFrame:CGRectZero];
        [self.editBtn setImage:[UIImage imageNamed:@"nav_cart_Green"] forState:UIControlStateNormal];
        [self.editBtn setTitle:@"Edit" forState:UIControlStateNormal];
        self.editBtn.layer.cornerRadius=4;
//        self.editBtn.backgroundColor=rgb(236, 236, 236);
        [self.editBtn addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgImgView addSubview:self.editBtn];
        
        self.buyBtn=[[JSDIYButton alloc] initWithFrame:CGRectZero];
        [self.buyBtn setImage:[UIImage imageNamed:@"nav_cart_Green"] forState:UIControlStateNormal];
        [self.buyBtn setTitle:@"buy" forState:UIControlStateNormal];
        self.buyBtn.layer.cornerRadius=4;
//        self.buyBtn.backgroundColor=rgb(236, 236, 236);
        [self.buyBtn addTarget:self action:@selector(buy:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgImgView addSubview:self.buyBtn];
        
#pragma mark - 线
        
        self.lineImgView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        self.lineImgView.layer.borderColor=KborderColor.CGColor;
        self.lineImgView.layer.borderWidth=0.5f;
        [self.bgImgView addSubview:self.lineImgView];
        
        
        
        
        
    }
    return self;
}


-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    
    [super JSCollectionViewController:JSCtrl collectionViewDateArr:dateArr cellValue:date indexPath:indexpath];
    self.frameModel=JSCtrl.data[indexpath.row];

    
    
    
    
    
    
}







-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.frameModel layoutSubFrame:self.contentView.bounds];
    
    
#pragma mark -左边坐标布局
    
#pragma mark - 0:背景图坐标
    
    
    
    
    
#pragma mark -  Edit和Buy
    self.editBtn.frame=self.frameModel.edit_Frame;
    self.buyBtn.frame=self.frameModel.buy_Frame;
    
#pragma mark - 线
    self.lineImgView.frame=self.frameModel.product_line_Frame;
    
    
}



-(void)edit:(UIButton *)btn{
    
    
}

-(void)buy:(UIButton *)btn{
    
    
}


@end

