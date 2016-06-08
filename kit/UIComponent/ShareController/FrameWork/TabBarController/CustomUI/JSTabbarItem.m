//
//  JSTabbarItem.m
//  kit
//
//  Created by gcb999 on 16/6/8.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabbarItem.h"
#define  KJSTabbarItem 0.75

@implementation JSTabbarItem
- (id)initWithFrame:(CGRect)frame itemDesc:(JSTabbarItemModel *)desc {
    if (self = [super initWithFrame:frame]) {
        // 设置高亮显示的背景
//        [self setHighlightedBg:@"tabbar_slider.png"];
        // 设置selected=YES时的背景
//       [self setSelectedBg:@"tabbar_slider.png"];
        
        // 设置默认的Image
        [self setImage:[UIImage imageNamed:desc.normal] forState:UIControlStateNormal];
        // 设置selected=YES时的image
        [self setImage:[UIImage imageNamed:desc.highlighted] forState:UIControlStateSelected];
        
        // 不需要在用户长按的时候调整图片为灰色
        self.adjustsImageWhenHighlighted = NO;
        // 设置UIImageView的图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        // 设置文字
        [self setTitle:desc.title forState:UIControlStateNormal];
        // 设置文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 设置字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:10];
    }
    return self;
}

#pragma mark - 覆盖父类的2个方法
#pragma mark 设置按钮标题的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    UIImage *image =  [self imageForState:UIControlStateNormal];
    CGFloat titleY = image.size.height - 3;
    CGFloat titleHeight = self.bounds.size.height - titleY;
    return CGRectMake(0, titleY, self.bounds.size.width,  titleHeight);
}
#pragma mark 设置按钮图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    UIImage *image =  [self imageForState:UIControlStateNormal];
    return CGRectMake(0, 0, self.bounds.size.width, image.size.height);
}

@end



