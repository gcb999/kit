//
//  JSItemImgageViewCell.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/28.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSItemImgageViewCell.h"
#import "JSItemImageViewController.h"
#import "JSBigItemImageViewController.h"

@implementation JSItemImgageViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect rect=self.contentView.bounds;
        
        self.aimgview=[UIImageView ImageViewImageName:@"" frame:rect];
        [self.contentView addSubview:self.aimgview];
        
        
    }
    return self;
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    
    
    [self loadingBigPlaceholderImageName:date imgview:self.aimgview];
    
    [self setImgScaleAspect:JSCtrl];
    
}


#pragma mark -图片比例设置
-(void)setImgScaleAspect:(JSCollectionViewController *)JSCtrl{
    if (JSCtrl.view.tag==1) {
        self.aimgview.contentMode=UIViewContentModeScaleAspectFill;
    }
    else if (JSCtrl.view.tag==2){
        self.aimgview.contentMode=UIViewContentModeScaleAspectFit;
    }
}

@end
