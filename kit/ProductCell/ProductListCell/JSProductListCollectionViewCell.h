//
//  JSProductListCollectionViewCell.h
//  SailvanElec
//
//  Created by gcb999 on 16/6/1.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSProductListCollectionViewCellFrameModel.h"
#import "JSBaseProductCollectionCell.h"

@interface JSProductListCollectionViewCell : JSBaseProductCollectionCell




#pragma mark -  Edit和Buy

@property(nonatomic,strong)JSDIYButton *editBtn;
@property(nonatomic,strong)JSDIYButton *buyBtn;





#pragma mark - 线
@property(nonatomic,strong)UIImageView *lineImgView;


@end
