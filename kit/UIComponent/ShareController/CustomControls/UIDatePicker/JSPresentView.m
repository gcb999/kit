//
//  PresentView.m
//  JiangSuTax
//
//  Created by Jobs on 13-6-3.
//  Copyright (c) 2013年 apple user. All rights reserved.
//

#import "JSPresentView.h"

@interface JSPresentView ()
{
    UIView *jsView;
}
@end

@implementation JSPresentView

static UIView *alphaView;

static  UIView *msubView;


#pragma mark -自定义弹出高度


+(void)showWithSubView:(UIView*)subView  rowHeight:(CGFloat)rowHeight{
    
    CGRect r = [[UIApplication sharedApplication] keyWindow].frame;
    
    alphaView = [[UIView alloc] initWithFrame:r];
    alphaView.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.4];;
    [[[UIApplication sharedApplication] keyWindow] addSubview:alphaView];
    [alphaView addSubview:subView];
    
    
    
    
    
    
    subView.frame = CGRectMake(0, 2000, IPHONScreenWidth, IPHONScreenHeight);
    
    msubView=subView;
    
    CGRect hrect,rect=r;
    CGFloat heigth=(1-rowHeight)*rect.size.height;
    CGRectDivide(rect, &hrect, &rect, heigth, CGRectMinYEdge);
    
    
    //上面部分
    UIView *headerView=[[UIView alloc] initWithFrame:hrect];
    [alphaView addSubview:headerView];
    
    //添加向下手势
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    //设置滑动方向，下面以此类推
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [headerView  addGestureRecognizer:recognizer];
    
    
    //添加点击手势
    
    UITapGestureRecognizer *panRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [headerView addGestureRecognizer:panRecognizer];
    
    
    
    //下部分
    [UIView animateWithDuration:0.25 animations:^{
        subView.frame = rect;
    } completion:^(BOOL finished) {
        
        
    }];
}

#pragma mark -默认弹出高度0.5

+(void)showWithSubView:(UIView*)subView {

    [self showWithSubView:subView rowHeight:0.5];
    
}

#pragma mark -添加向下手势

+(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    
    if (recognizer.direction==UISwipeGestureRecognizerDirectionDown) {
        //执行程序
        [JSPresentView hidePresentSubView];
    }
}

#pragma mark 点击手势
+(void)handlePan:(UITapGestureRecognizer *)recognizer{
    [JSPresentView hidePresentSubView];
}



+(void)hidePresentSubView{
    
    
    [UIView animateWithDuration:0.25 animations:^{
        msubView.frame = CGRectMake(0, 2000, IPHONScreenWidth, IPHONScreenHeight);
        alphaView.backgroundColor=[UIColor clearColor];
    } completion:^(BOOL finished) {
        [alphaView removeFromSuperview];
        
    }];
    
}


@end
