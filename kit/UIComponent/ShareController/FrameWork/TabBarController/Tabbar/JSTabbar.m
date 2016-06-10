//
//  JSTabbar.m
//  kit
//
//  Created by gcb999 on 16/6/8.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabbar.h"

@interface JSTabbar ()
{
    // 当前被选中的tabbaritem
    JSTabbarItem *_current;
}


@end


@implementation JSTabbar


#pragma mark -构造方法
- (id)initWithFrame:(CGRect)frame items:(NSArray<JSTabbarItemModel *> *)items {
    if (self = [super initWithFrame:frame]) {
        // colorWithPatternImage ： 平铺一张图片来生成背景颜色
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
        
        NSInteger count = items.count;
        
        CGFloat itemHeight = self.bounds.size.height;
        CGFloat itemWidth = self.bounds.size.width / count;
        
        for (int index = 0; index < count; index++) {
            JSTabbarItemModel *desc = [items objectAtIndex:index];
            CGFloat itemX = index * itemWidth;
            CGRect itemFrame = CGRectMake(itemX, 0, itemWidth, itemHeight);
            JSTabbarItem *item = [[JSTabbarItem alloc] initWithFrame:itemFrame itemDesc:desc];
            // 设置一个标记
            item.tag = index+100;
            
            [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:item];

            
            if (index == 0) {
                // 让第0个item选中
                [self itemClick:item];
            }
        }
        
    }
    return self;
}

#pragma mark item点击
- (void)itemClick:(JSTabbarItem *)new {
    // 设置selected为YES，就能达到UIControlStateSelected状态
    if (_current != new) {
        if ([self.delegate respondsToSelector:@selector(tabbarItemChangeFrom:to:)]) {
            [self.delegate tabbarItemChangeFrom:_current.tag-100 to:new.tag-100];
        }
        
        _current.userInteractionEnabled = YES;
        new.userInteractionEnabled = NO;
        
        new.selected = YES;
        _current.selected = NO;
        _current = new;
    }
}



#pragma mark -得到当前对应item

-(JSTabbarItem *)tabbarItem:(NSInteger)index{
    
  return (JSTabbarItem *)[self viewWithTag:100+index];
}


@end
