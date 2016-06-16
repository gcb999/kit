//
//  JSProductListCollectionCell.m
//  kit
//
//  Created by gcb999 on 16/6/16.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSProductListCollectionCell.h"

@implementation JSProductListCollectionCell

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
        
        
        
        
        
        
        
    }
    return self;
}


-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    self.modelFrame=JSCtrl.data[indexpath.row];
    [self assignValue:self.modelFrame];
    
    
}







-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    
}



-(void)edit:(UIButton *)btn{
    
    
}

-(void)buy:(UIButton *)btn{
    
    
}
@end
