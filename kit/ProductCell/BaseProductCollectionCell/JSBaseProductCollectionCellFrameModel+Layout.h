//
//  JSBaseProductCollectionCellFrameModel+Layout.h
//  SailvanElec
//
//  Created by gcb999 on 16/6/2.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSBaseProductCollectionCellFrameModel.h"

@interface JSBaseProductCollectionCellFrameModel (Layout)



#pragma mark -计算Cell的高度

-(void)layoutRowHeight:(JSBaseProductCollectionCellModel *)frameModel;


#pragma mark - 重新算Cell坐标

-(void)layoutSubFrame:(CGRect)rect ;

@end
