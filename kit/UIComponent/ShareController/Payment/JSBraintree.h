//
//  JSBraintree.h
//  JSThridPod
//
//  Created by gcb999 on 16/4/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Braintree/Braintree.h>
#import <Braintree/BTData.h>

typedef void (^BraintreeCompletion)(BOOL,BTPaymentMethod *,BTData *,UIViewController *ctrl);


@interface JSBraintree : NSObject<BTDropInViewControllerDelegate>


@property(nonatomic,copy)payPalCompletion payPalCompletion;

//声明VC
@property(nonatomic,strong)UIViewController *currentCtrl;
//声明Block
@property(nonatomic,copy)BraintreeCompletion braintreeCompletion;

//BT数据
@property(nonatomic,strong)BTData *braintreedata;

//设备信息
@property(nonatomic,strong)NSString *deviceData;


+(JSBraintree*)share;

-(void)brainTreeWithClientID:(NSString *)clientID   amount:(NSString *)amount  currentCtrl:(UIViewController *)ctr braintreeCompletion:(void (^)(BOOL isSuccess,BTPaymentMethod * paypalmethod,BTData *btdate,UIViewController *ctrl)) braintreeCompletion;

@end
