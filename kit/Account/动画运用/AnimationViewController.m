
//
//  AnimationViewController.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "AnimationViewController.h"
#import "JSPickerViewController.h"
#import "JSDatePickerViewController.h"
#import "HomeDetailViewController.h"

@interface AnimationViewController ()

@property(nonatomic,strong)JSPresentBaseTransition *transition;
@property(nonatomic,strong)JSPresentTransformScaleTransition *scaleTransition;
@end


@implementation AnimationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect=CGRectMake(0, 0, IPHONScreenWidth, 40);
    
    UIButton *btn=[UIButton ButtonWithSystemImage:rect title:@"UIPickerView动画" titleColor:KCOLOR_RED font:KNormalFontSize target:self action:@selector(click)];
    [self.view addSubview:btn];
    
    
    rect=CGRectMake(0, 40, IPHONScreenWidth, 40);
    btn=[UIButton ButtonWithSystemImage:rect title:@"DatePicker动画" titleColor:KCOLOR_RED font:KNormalFontSize target:self action:@selector(datePick)];
    [self.view addSubview:btn];
    
    rect=CGRectMake(0, 80, IPHONScreenWidth, 40);
    btn=[UIButton ButtonWithSystemImage:rect title:@"商品详情动画" titleColor:KCOLOR_RED font:KNormalFontSize target:self action:@selector(detail)];
    [self.view addSubview:btn];
    
    
}

-(void)click{
    JSPickerViewController *ctrl=[[JSPickerViewController alloc] initWithData:@[@"1",@"2"] height:300 complete:^(JSPickerViewController *ctrl, NSString *text) {

        NSLog(@"---text=%@",text);
    }];

    
    self.transition=[[JSPresentBaseTransition alloc] initWithPresented:^(UIViewController *presented, UIViewController *presenting, UIViewController *source, HYBBaseTransition *transition) {
        
    } dismissed:^(UIViewController *dismissed, HYBBaseTransition *transition) {
        self.transition.transitionMode = kHYBTransitionDismiss;
    }];
    
    //     vc.modalPresentationStyle = UIModalPresentationCustom;
    ctrl.transitioningDelegate = self.transition;
    
    [self presentViewController:ctrl animated:YES completion:^{
        
    }];

}
-(void)datePick{
    
    JSDatePickerViewController *ctrl=[[JSDatePickerViewController alloc] initWitHeight:300 complete:^(JSDatePickerViewController *datePickerCtrl, NSString *text) {
        
        
        NSLog(@"---text=%@",text);
    }];
    
    
    self.transition=[[JSPresentBaseTransition alloc] initWithPresented:^(UIViewController *presented, UIViewController *presenting, UIViewController *source, HYBBaseTransition *transition) {
        
    } dismissed:^(UIViewController *dismissed, HYBBaseTransition *transition) {
        self.transition.transitionMode = kHYBTransitionDismiss;
    }];
    
    //     vc.modalPresentationStyle = UIModalPresentationCustom;
    ctrl.transitioningDelegate = self.transition;
    
    [self presentViewController:ctrl animated:YES completion:^{
        
    }];
    
}
-(void)detail{
    HomeDetailViewController *ctrl=[[HomeDetailViewController alloc] init];
   
    [self.navigationController pushViewController:ctrl animated:YES];
    
    
}
@end
