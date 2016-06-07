//
//  PresentView.h
//  JiangSuTax
//
//  Created by Jobs on 13-6-3.
//  Copyright (c) 2013年 apple user. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JSPresentView : UIView{
    
    
}

#pragma mark -默认弹出高度0.5
+(void)showWithSubView:(UIView*)subView ;

#pragma mark -自定义弹出高度
+(void)showWithSubView:(UIView*)subView  rowHeight:(CGFloat)rowHeight;


+(void)hidePresentSubView;




@end
