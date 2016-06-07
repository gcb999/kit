//
//  JSPayPal.h
//  JSThridPod
//
//  Created by gcb999 on 16/4/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PayPalMobile.h"
#import "PayPalPayment.h"




typedef void (^payPalCompletion)(BOOL,PayPalPayment *);


@interface JSPayPal : NSObject<PayPalPaymentDelegate>

+(JSPayPal*)share;


@property(nonatomic,copy)payPalCompletion payPalCompletion;


@property(nonatomic,strong)UIViewController *currentCtrl;


#pragma mark -初始化  client ID

-(void)initPayPalMobile;


#pragma mark -  Create a PayPalPayment

-(PayPalPayment *)paymentWithOrderId:(NSString *)OrderId  subProductItems:(NSArray<NSDictionary *>*)subProductItems total:(NSString *)total shipping:(NSString *)_shipping tax:(NSString *)_tax;


#pragma mark -支付

-(void)PayPalment:(PayPalPayment*) payment  currentCtrl:(UIViewController *)ctrl payPalCompletion: (void(^)(BOOL isSuccess , PayPalPayment *paypalment ))payPalCompletion;


@end
