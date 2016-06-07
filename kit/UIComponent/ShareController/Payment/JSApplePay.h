//
//  JSApplePay.h
//  JSThridPod
//
//  Created by gcb999 on 16/4/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PassKit/PassKit.h>                                 //用户绑定的银行卡信息
#import <PassKit/PKPaymentAuthorizationViewController.h>    //Apple pay的展示控件
#import <AddressBook/AddressBook.h>                         //用户联系信息相关

typedef void (^ApplePayCompletion)(BOOL);

@interface JSApplePay : NSObject<PKPaymentAuthorizationViewControllerDelegate>
{
    NSMutableArray *shippingMethods;
    NSMutableArray *shippings;
}

+(JSApplePay*)share;

@property(nonatomic,strong)PKPaymentRequest *payRequest;


@property(nonatomic,strong)UIViewController *currentCtrl;
@property(nonatomic,copy)ApplePayCompletion applePayCompletion;

#pragma mark -----设置订单运输费方式（运费，运输地址）

-(NSMutableArray<PKShippingMethod *> *)orderShippingMethod:(NSArray<NSDictionary *> *)shippings;

#pragma mark - 设置订单结账信息

-(NSMutableArray<PKPaymentSummaryItem *> *)orderSubTotal:(NSString *)subTotal  discountAmount:(NSString *)discount shipping:(NSString *)shipping;


-(void)ApplePay:(UIViewController *)ctrl shippingMethods:(NSArray<PKShippingMethod *> *)shippingMethods  paymentSummaryItems:(NSArray<PKPaymentSummaryItem *> * )paymentSummaryItems ApplePayCompletion:(void (^)(BOOL))applePayCompletion;
    

@end
