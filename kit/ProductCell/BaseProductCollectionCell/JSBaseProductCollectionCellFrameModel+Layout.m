//
//  JSBaseProductCollectionCellFrameModel+Layout.m
//  SailvanElec
//
//  Created by gcb999 on 16/6/2.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSBaseProductCollectionCellFrameModel+Layout.h"

@implementation JSBaseProductCollectionCellFrameModel (Layout)


#pragma mark -计算Cell的高度

-(void)layoutRowHeight:(JSBaseProductCollectionCellModel *)Model;
{
    self.baseModel=Model;
    self.rowHeight=0;
    [self layoutSubFrame:CGRectMake(0, 0, IPHONScreenWidth, 100000)];
}



#pragma mark - 重新算Cell坐标

-(void)layoutSubFrame:(CGRect)rect {
    
    self.rowHeight=0;
    NSLog(@"---父类必须重新改方法")
    
}








@end
