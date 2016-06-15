//
//  NSObject+Coordinates.m
//  kit
//
//  Created by gcb999 on 16/6/15.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "NSObject+Coordinates.h"

@implementation NSObject (Coordinates)

-(CGRect)centerForParentViewFrame:(CGRect)rect subsize:(CGSize)size{
    
    
    CGFloat width=(rect.size.width-size.width)*0.5f;
    CGFloat heigth=(rect.size.height-size.height)*0.5f;
    return UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(heigth, width, heigth, width));
}
@end
