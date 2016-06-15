//
//  JSSimpleTableViewCellModelFrame.m
//  kit
//
//  Created by gcb999 on 16/6/15.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSSimpleTableViewCellModelFrame.h"

@implementation JSSimpleTableViewCellModelFrame

#pragma mark -------------------- 基本布局--------------------

-(instancetype)initWithModel:(JSSimpleTableViewCellModel *)model{
    
    if (self=[super init]) {
        self.model=model;
   
        CGRect lrect, rect=CGRectMake(0, 0, IPHONScreenWidth, KJSSimpleTableViewCellRowHeight);
        //背景图
        _bgImageView_Frame=rect;
        
        rect=UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(0, 5, 0, 0));
        
        
        //图标
        if (IS_NSString(self.model.iconUrl)) {
            CGRectDivide(rect, &lrect, &rect, 40, CGRectMinXEdge);
            _iconImageView_Frame=[self centerForParentViewFrame:lrect subsize:CGSizeMake(30, 30)];
            
        }
        else{
            _iconImageView_Frame=CGRectZero;
            CGRectDivide(rect, &lrect, &rect, 10, CGRectMinXEdge);
            
        }
        
        //标题和箭头
        if(self.model.flag){
            
            CGFloat width =rect.size.width-40;
            CGRectDivide(rect, &lrect, &rect, width, CGRectMinXEdge);
            _titleLabel_Frame=lrect;
           _jtImageView_Frame=[self centerForParentViewFrame:rect subsize:CGSizeMake(12, 12)];
            
        }
        else{
            _titleLabel_Frame=rect;
           _jtImageView_Frame=CGRectZero;
        }

    }
    
    return self;
}
@end
