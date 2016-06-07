//
//  UIView+Coordinates.m
//  UIComponent
//
//  Created by gcb999 on 16/6/6.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "UIView+Coordinates.h"

@implementation UIView (Coordinates)


-(CGRect)centerForParentViewFrame:(CGRect)rect subsize:(CGSize)size{
    

    CGFloat width=(rect.size.width-size.width)*0.5f;
    CGFloat heigth=(rect.size.height-size.height)*0.5f;
    return UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(heigth, width, heigth, width));
}

- (UIViewController *)viewController {
    //通过响应者链，获取此视图所在的视图控制器
    UIResponder *next = self.nextResponder;
    do {
        //判断响应者对象是否是视图控制器对象
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        //不停的指向下一个响应者
        next = next.nextResponder;
        
    }while (next != nil);
    
    return nil;
}


@end
