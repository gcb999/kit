//
//  UIView+Badge.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "UIView+Badge.h"

@implementation UIView (Badge)

-(void)showBadge:(NSString *)badge animationType:(JSBadgeAnimType)animationType{
   
    
    for (UIView *subview in self.subviews) {
        if (subview.tag==0x100) {
            [subview removeFromSuperview];
        }
    }
    
    
    CGFloat x=self.size.width/2;
   
    UILabel * badgeLabel = [[UILabel alloc]init];
    badgeLabel.tag=0x100;
    badgeLabel.text=badge;
    
    if (!IS_NSString(badge) || [badge isEqualToString:@"0"]) {
        badgeLabel.frame=CGRectZero;
    }
    
    else if (badge.length<=2) {
        
        badgeLabel.font = [UIFont systemFontOfSize:12];
        badgeLabel.frame=CGRectMake(x+3, -5, 20, 20);
        badgeLabel.layer.cornerRadius = 10;     //这个为frame size 的一半,既变成圆形
    }
    else{
       
        badgeLabel.font =[UIFont systemFontOfSize:10];;
        badgeLabel.frame=CGRectMake(x+3, -5, 20, 20);
        badgeLabel.layer.cornerRadius = 10;     //这个为frame size 的一半,既变成圆形
        badgeLabel.text=@"99+";
    }
    
    badgeLabel.textColor = [UIColor whiteColor];      //文字颜色
    badgeLabel.textAlignment = NSTextAlignmentCenter;     //居中
    badgeLabel.layer.borderWidth = 1;     //边界宽度
    badgeLabel.layer.masksToBounds = YES;
    badgeLabel.layer.backgroundColor = [UIColor redColor].CGColor;  //红色背景
    badgeLabel.layer.borderColor = badgeLabel.backgroundColor.CGColor;    //边界白色
    
    [self addSubview:badgeLabel];
    
    if (animationType==JSBadgeAnimTypeScale) {
        [self easyInEasyOutView:self];
    }
    
}

-(void)hideBadge{
    
    for (UIView *subview in self.subviews) {
        if (subview.tag==0x100) {
            [subview removeFromSuperview];
        }
    }
    
}

- (void)easyInEasyOutView:(UIView *)view
{
    [UIView animateWithDuration:0.25f animations:^{
        view.transform = CGAffineTransformMakeScale(1.2,1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15f animations:^{
            view.transform = CGAffineTransformMakeScale(0.85, 0.85);
        } completion:^(BOOL finished) {
            view.transform = CGAffineTransformIdentity;
        }];
    }];
}

@end
