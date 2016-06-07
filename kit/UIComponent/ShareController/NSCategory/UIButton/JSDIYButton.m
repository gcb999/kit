//
//  JSCommonButton.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/31.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSDIYButton.h"

#define KJSDIYImgViewWidth 40
#define KJSDIYImgViewHeight 40


@implementation JSDIYButton



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //设置image
        self.adjustsImageWhenDisabled=NO;
        self.adjustsImageWhenHighlighted=NO;
        self.imageView.contentMode=UIViewContentModeScaleAspectFit;
        
       
        //设置title
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font=KNormalFontSize;
        self.titleLabel.textAlignment=NSTextAlignmentLeft;
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
//    CGFloat width=contentRect.size.width;
//    CGFloat height=contentRect.size.height;
    return CGRectMake(0,0,KJSDIYImgViewWidth,KJSDIYImgViewHeight);//图片大小40 *40
    
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat width=contentRect.size.width;
    CGFloat height=contentRect.size.height;
    
    return CGRectMake(KJSDIYImgViewWidth, 0, width-KJSDIYImgViewWidth, height);
}

@end
