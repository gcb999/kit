//
//  JSSelectedTableViewCellModelFrame.m
//  kit
//
//  Created by gcb999 on 16/6/15.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSSelectedTableViewCellModelFrame.h"


@implementation JSSelectedTableViewCellModelFrame

#pragma mark -------------------- 横排坐标--------------------

-(JSSelectedTableViewCellModelFrame *)initWithHorizontallyModel:(JSSelectedTableViewCellModel *)model

{
    if (self=[super init]) {
        self.model=model;
        CGRect  hrect,rect =CGRectMake(0, 0, IPHONScreenWidth, KHorizontallyRowHeight);
        //1: 背景图片
        _bgImageView_Frame=rect;
        
        rect=UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(0, 5, 0, 0));
        
        //2: 图片
        CGRectDivide(rect, &hrect, &rect, 50, CGRectMinXEdge);
        _iconImageView_Frame=[self centerForParentViewFrame:hrect subsize:CGSizeMake(40, 40)];
        
        //3：标题
        CGFloat width=rect.size.width-50;
        CGRectDivide(rect, &hrect, &rect, width, CGRectMinXEdge);
        _titleLabel_Frame=hrect;
        
        //4:选中图片
        _selelctedImageView_Frame=[self centerForParentViewFrame:rect subsize:CGSizeMake(15, 15)];
        
        
        _rowHeight=KHorizontallyRowHeight;

    }
    return self;
    
    
}


//#pragma mark --------------------上下 Up and down--------------------
-(JSSelectedTableViewCellModelFrame *)initWithUpAndDownModel:(JSSelectedTableViewCellModel *)model{
    
    if (self=[super init]) {
        
        self.model=model;
        
        CGRect hrect, rect =CGRectMake(0, 0, IPHONScreenWidth, KUpAndDownModelRowHeight);
        //1: 背景图片
        _bgImageView_Frame=rect;
        
        rect=UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(0, 5, 0, 0));
        
        //选择背景
        CGFloat width=IPHONScreenWidth-50;
        CGRectDivide(rect, &hrect, &rect, width, CGRectMinXEdge);
        _selelctedImageView_Frame=[self centerForParentViewFrame:rect subsize:CGSizeMake(15, 15)];
        
        //图片 
        CGFloat imgheight=KUpAndDownModelRowHeight*0.5f;
        
        CGRect imgRect;
        //高度切割
        CGRectDivide(hrect, &imgRect, &hrect, imgheight, CGRectMinYEdge);
        

        
        _iconImageView_Frame=[self centerForParentViewFrame:CGRectMake(5,5,60,imgRect.size.height) subsize:CGSizeMake(60, 25)];
        
        //标题
        _titleLabel_Frame=UIEdgeInsetsInsetRect(hrect, UIEdgeInsetsMake(10, 0, 0, 0));
        
        
        _rowHeight=KUpAndDownModelRowHeight;
    }
    
    return self;
  
}


@end
