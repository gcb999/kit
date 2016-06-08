//
//  JSLoginViewController.m
//  kit
//
//  Created by gcb999 on 16/6/8.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSLoginViewController.h"

@implementation JSLoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect=CGRectMake(0, 0, IPHONScreenWidth, 40);
    UIButton *btn=[UIButton ButtonWithSystemImage:rect title:@"FB登陆" titleColor:KCOLOR_RED font:KNormalFontSize target:self action:@selector(click)];
    [self.view addSubview:btn];
    
    rect=CGRectMake(0, 40, IPHONScreenWidth, 40);
    btn=[UIButton ButtonWithSystemImage:rect title:@"FB分享" titleColor:KCOLOR_RED font:KNormalFontSize target:self action:@selector(share)];
    [self.view addSubview:btn];
    
    
}

-(void)click{
    
   [[JSFaceBook shareInstance] loginFromViewController:self complete:^(JSFaceBookLoginState LoginState, id complete) {
       if (LoginState==JSFaceBookLoginError) {
           NSLog(@"---错误");
       }
       else if (LoginState==JSFaceBookLoginCancel){
           NSLog(@"---取消");
       }
       else{
           NSDictionary *result=(NSDictionary *)complete;
           NSString *email=result[@"email"];
           NSLog(@"----email=%@",email);
       }
       
   }];
}
-(void)share{
    
    [[JSFaceBook shareInstance] shareForFacebook:@"hehe" shareImageUrl:@"http://images.cnitblog.com/blog/215975/201405/311744526507841.png" ShareCompleteBlock:^(JSFaceBookShareState shareState) {
        if (shareState==JSFaceBookShareError) {
            NSLog(@"---错误");
        }
        else if (shareState==JSFaceBookShareCancel){
            NSLog(@"---取消");
        }
        else{
   
            NSLog(@"----email");
        }

     
    }];
    
}
@end
