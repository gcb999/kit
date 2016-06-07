//
//  JSProductViewCell.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/30.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSProductCollectionViewCellFrameModel.h"
#import "JSBaseProductCollectionCell.h"

@interface JSProductCollectionViewCell : JSBaseProductCollectionCell




#pragma mark - 1: Edit和Buy

@property(nonatomic,strong)JSDIYButton *editBtn;
@property(nonatomic,strong)JSDIYButton *buyBtn;




@end
