//
//  JSBraintree.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSBraintree.h"

/*
BT交互步骤

1：ios客户端会传递“一些描述和钱”。

2：然后服务端返回一个“唯一标识”给客户端。

3：客户端拿到这个“唯一标识”，在和我们服务交互。
 
 */


@implementation JSBraintree


+(JSBraintree*)share{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
        
    });
    return _sharedObject;
}






-(void)brainTreeWithClientID:(NSString *)clientID   amount:(NSString *)amount  currentCtrl:(UIViewController *)ctr braintreeCompletion:(void (^)(BOOL, BTPaymentMethod *, BTData *, UIViewController *))braintreeCompletion{
    
    NSString *clientToken = @"eyJ2ZXJzaW9uIjoyLCJhdXRob3JpemF0aW9uRmluZ2VycHJpbnQiOiIyMjBhY2UzZjg0ZDJiZmQ3MGExMWMyODgyM2JlMzlkZmNlNjVkYmQ5ZTYxNzNmMjQ4NzgxZmM4YTUwMTE1OTQ4fGNyZWF0ZWRfYXQ9MjAxNi0wNC0yOFQwMzowOTo0NC41MzAwNDI4MjMrMDAwMFx1MDAyNmN1c3RvbWVyX2lkPTE0ODEwOTg1N1x1MDAyNm1lcmNoYW50X2lkPWRxZ3FrZ25kanFnNnJnd25cdTAwMjZwdWJsaWNfa2V5PWQ1ZzQ5cWttM2t6N3J2cnQiLCJjb25maWdVcmwiOiJodHRwczovL2FwaS5icmFpbnRyZWVnYXRld2F5LmNvbTo0NDMvbWVyY2hhbnRzL2RxZ3FrZ25kanFnNnJnd24vY2xpZW50X2FwaS92MS9jb25maWd1cmF0aW9uIiwiY2hhbGxlbmdlcyI6WyJjdnYiXSwiZW52aXJvbm1lbnQiOiJwcm9kdWN0aW9uIiwiY2xpZW50QXBpVXJsIjoiaHR0cHM6Ly9hcGkuYnJhaW50cmVlZ2F0ZXdheS5jb206NDQzL21lcmNoYW50cy9kcWdxa2duZGpxZzZyZ3duL2NsaWVudF9hcGkiLCJhc3NldHNVcmwiOiJodHRwczovL2Fzc2V0cy5icmFpbnRyZWVnYXRld2F5LmNvbSIsImF1dGhVcmwiOiJodHRwczovL2F1dGgudmVubW8uY29tIiwiYW5hbHl0aWNzIjp7InVybCI6Imh0dHBzOi8vY2xpZW50LWFuYWx5dGljcy5icmFpbnRyZWVnYXRld2F5LmNvbS9kcWdxa2duZGpxZzZyZ3duIn0sInRocmVlRFNlY3VyZUVuYWJsZWQiOmZhbHNlLCJwYXlwYWxFbmFibGVkIjpmYWxzZSwiY29pbmJhc2VFbmFibGVkIjpmYWxzZSwibWVyY2hhbnRJZCI6ImRxZ3FrZ25kanFnNnJnd24iLCJ2ZW5tbyI6Im9mZiIsImFwcGxlUGF5Ijp7InN0YXR1cyI6InByb2R1Y3Rpb24iLCJjb3VudHJ5Q29kZSI6IlVTIiwiY3VycmVuY3lDb2RlIjoiVVNEIiwibWVyY2hhbnRJZGVudGlmaWVyIjoibWVyY2hhbnQuY29tLmhrZGVhbHNhbGVsaXZlIiwic3VwcG9ydGVkTmV0d29ya3MiOlsidmlzYSIsIm1hc3RlcmNhcmQiLCJhbWV4Il19fQ==";
    //1:初始化BT
    Braintree *btree = [Braintree braintreeWithClientToken:clientToken];
   
    //2:获取BT Date
    self.braintreedata=[[BTData alloc] initWithClient:btree.client environment:BTDataEnvironmentProduction];
    
    //3：获取设备信息
    self.deviceData=[self.braintreedata collectDeviceData];
    
    //4： 创建BT BTDropInViewController 并且赋值
    BTDropInViewController* _dropInViewController=[btree dropInViewControllerWithDelegate:self];
    _dropInViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                                           target:self
                                                                                                           action:@selector(userDidCancelPayment)];
    _dropInViewController.title = @"Check Out";
    _dropInViewController.summaryTitle = @"Deal Sale";
    _dropInViewController.summaryDescription = @"Dealsale shopping";
    _dropInViewController.displayAmount =amount ;
    _dropInViewController.callToActionText =[NSString stringWithFormat:@"ordertotal-- Subscribe Now"];

    UIBarButtonItem *item = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                             target:self
                             action:@selector(userDidCancelPayment)];
    _dropInViewController.navigationItem.leftBarButtonItem = item;
    
    
    
   //5：赋值控制器 和Block
   self.currentCtrl=ctr;
    self.braintreeCompletion=braintreeCompletion;
    
   
    
   //6： 模态控制器
    UINavigationController *navigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:_dropInViewController];
    [ctr presentViewController:navigationController animated:YES completion:nil];
    
    
}




- (void)userDidCancelPayment {
    [self.currentCtrl dismissViewControllerAnimated:YES completion:nil];
    self.braintreeCompletion(NO,nil,nil,nil);
}



#pragma mark -代理方法

- (void)dropInViewController:(BTDropInViewController *)viewController didSucceedWithPaymentMethod:(BTPaymentMethod *)paymentMethod{
    self.braintreeCompletion(YES,paymentMethod,self.braintreedata,self.currentCtrl);
    
    
}
- (void)dropInViewControllerDidCancel:(BTDropInViewController *)viewController{
    
    
      [self.currentCtrl dismissViewControllerAnimated:YES completion:nil];
      self.braintreeCompletion(NO,nil,nil,nil);
}



@end
