//
//  JSApplePay.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSApplePay.h"



@implementation JSApplePay


+(JSApplePay*)share{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
        
    });
    return _sharedObject;
}




#pragma mark -设备Applepay权限检测

-(void)ApplePay:(UIViewController *)ctrl shippingMethods:(NSArray<PKShippingMethod *> *)shippingMethods  paymentSummaryItems:(NSArray<PKPaymentSummaryItem *> * )paymentSummaryItems ApplePayCompletion:(void (^)(BOOL))applePayCompletion{
    
   
    if (![PKPaymentAuthorizationViewController class]) {
        //PKPaymentAuthorizationViewController需iOS8.0以上支持
        NSLog(@"操作系统不支持ApplePay，请升级至9.0以上版本，且iPhone6以上设备才支持");
        return;
    }
    //检查当前设备是否可以支付
    if (![PKPaymentAuthorizationViewController canMakePayments]) {
        //支付需iOS9.0以上支持
        NSLog(@"设备不支持ApplePay，请升级至9.0以上版本，且iPhone6以上设备才支持");
        return;
    }
    //检查用户是否可进行某种卡的支付，是否支持Amex、MasterCard、Visa与银联四种卡，根据自己项目的需要进行检测
    NSArray *supportedNetworks = @[PKPaymentNetworkAmex, PKPaymentNetworkMasterCard,PKPaymentNetworkVisa,PKPaymentNetworkChinaUnionPay];
    if (![PKPaymentAuthorizationViewController canMakePaymentsUsingNetworks:supportedNetworks]) {
        NSLog(@"没有绑定支付卡");
        return;
    }
    NSLog(@"可以支付，开始建立支付请求");
    //设置币种、国家码及merchant标识符等基本信息
    PKPaymentRequest *payRequest = [[PKPaymentRequest alloc]init];
    payRequest.countryCode = @"CN";     //国家代码
    payRequest.currencyCode = @"CNY";       //RMB的币种代码
    payRequest.merchantIdentifier = @"merchant.ApplePayDemoYasin";  //申请的merchantID
    payRequest.supportedNetworks =  [[NSArray alloc] initWithObjects:PKPaymentNetworkAmex, PKPaymentNetworkMasterCard, PKPaymentNetworkVisa, nil];   //用户可进行支付的银行卡
    payRequest.merchantCapabilities = PKMerchantCapability3DS|PKMerchantCapabilityEMV;      //设置支持的交易处理协议，3DS必须支持，EMV为可选，目前国内的话还是使用两者吧
    //    payRequest.requiredBillingAddressFields = PKAddressFieldEmail;
    //如果需要邮寄账单可以选择进行设置，默认PKAddressFieldNone(不邮寄账单)
    //楼主感觉账单邮寄地址可以事先让用户选择是否需要，否则会增加客户的输入麻烦度，体验不好，
    payRequest.requiredShippingAddressFields = PKAddressFieldPostalAddress|PKAddressFieldPhone|PKAddressFieldName;
    //送货地址信息，这里设置需要地址和联系方式和姓名，如果需要进行设置，默认PKAddressFieldNone(没有送货地址)
    //
    self.payRequest=payRequest;
  
    payRequest.shippingMethods = shippingMethods;
    
    payRequest.paymentSummaryItems = paymentSummaryItems;
    
    
    //ApplePay控件
    PKPaymentAuthorizationViewController *view = [[PKPaymentAuthorizationViewController alloc]initWithPaymentRequest:payRequest];
    view.delegate = self;
    [ctrl presentViewController:view animated:YES completion:nil];
    
    //赋值
    self.currentCtrl=ctrl;
    self.applePayCompletion=applePayCompletion;


}




#pragma mark -----设置订单运输费方式（运费，运输地址）

-(NSMutableArray<PKShippingMethod *> *)orderShippingMethod:(NSArray<NSDictionary *> *)shippings{
    
    NSMutableArray<PKShippingMethod *> * date=[[NSMutableArray<PKShippingMethod *> alloc] init];
    
    for (NSDictionary *shippingDic in shippings) {
        
        NSString *title=[shippingDic getObjectByKey:@"title"];
        NSString *identifier=[shippingDic getObjectByKey:@"identifier"];
        NSString *detail=[shippingDic getObjectByKey:@"detail"];
        
        PKShippingMethod *freeShipping = [PKShippingMethod summaryItemWithLabel:title amount:[NSDecimalNumber zero]];
        freeShipping.identifier = identifier;
        freeShipping.detail = detail;
        
        [date addObject:freeShipping];
        
        
    }
    
    return date;

}

#pragma mark - 设置订单结账信息

-(NSMutableArray<PKPaymentSummaryItem *> *)orderSubTotal:(NSString *)subTotal  discountAmount:(NSString *)discount shipping:(NSString *)shipping{
    
    
    
    
    
        NSDecimalNumber *totalAmount = [NSDecimalNumber zero];

        //总订单价格
        NSDecimalNumber *subtotalAmount = [NSDecimalNumber decimalNumberWithString:subTotal];
        PKPaymentSummaryItem *PKSubTotal = [PKPaymentSummaryItem summaryItemWithLabel:@"subTotal" amount:subtotalAmount];
        totalAmount = [totalAmount decimalNumberByAdding:subtotalAmount];//计算订单实际价格 +

        //优惠价格


        NSDecimalNumber *discountAmount=IS_NSString(discount)?[NSDecimalNumber decimalNumberWithString:discount]:[NSDecimalNumber zero];
        PKPaymentSummaryItem *PKDiscount = [PKPaymentSummaryItem summaryItemWithLabel:@"discount" amount:discountAmount];

        totalAmount = [totalAmount decimalNumberByAdding:discountAmount];////计算订单实际价格  价格应该- （-12.4）

        //邮费

        NSDecimalNumber *shippingAmount=IS_NSString(shipping)?[NSDecimalNumber decimalNumberWithString:shipping]:[NSDecimalNumber zero];

        PKPaymentSummaryItem *PKMethods = [PKPaymentSummaryItem summaryItemWithLabel:@"Shipping" amount:shippingAmount];

        totalAmount = [totalAmount decimalNumberByAdding:shippingAmount];////计算订单实际价格 +
    
    

    
        //付钱
        PKPaymentSummaryItem *PKTotal = [PKPaymentSummaryItem summaryItemWithLabel:@"Yasin" amount:totalAmount];  //最后这个是支付给谁。哈哈，快支付给我
    
   
        NSMutableArray<PKPaymentSummaryItem *> *arr=[NSMutableArray array];
        if(IS_NSString(discount)){

        [arr addObjectsFromArray:@[PKSubTotal, PKDiscount, PKMethods, PKTotal]];  //summaryItems为账单列表，类型是 NSMutableArray，这里设置成成员变量，在后续的代理回调中可以进行支付金额的调整。
        }
        else{
        [arr addObjectsFromArray:@[PKSubTotal, PKMethods, PKTotal]];  //summaryItems为账单列表，类型是 NSMutableArray，这里设置成成员变量，在后续的代理回调中可以进行支付金额的调整。
        }
    
        return arr;
    
  
}



#pragma mark - PKPaymentAuthorizationViewControllerDelegate

#pragma mark -送货地址回调
-(void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller
                  didSelectShippingContact:(PKContact *)contact
                                completion:(void (^)(PKPaymentAuthorizationStatus, NSArray<PKShippingMethod *> * _Nonnull, NSArray<PKPaymentSummaryItem *> * _Nonnull))completion{
    //contact送货地址信息，PKContact类型
    NSPersonNameComponents *name = contact.name;                //联系人姓名
    CNPostalAddress *postalAddress = contact.postalAddress;     //联系人地址
    NSString *emailAddress = contact.emailAddress;              //联系人邮箱
    CNPhoneNumber *phoneNumber = contact.phoneNumber;           //联系人手机
    NSString *supplementarySubLocality = contact.supplementarySubLocality;  //补充信息,iOS9.2及以上才有
    
    //送货信息选择回调，如果需要根据送货地址调整送货方式，比如普通地区包邮+极速配送，偏远地区只有付费普通配送，进行支付金额重新计算，可以实现该代理，返回给系统：shippingMethods配送方式，summaryItems账单列表，如果不支持该送货信息返回想要的PKPaymentAuthorizationStatus
    completion(PKPaymentAuthorizationStatusSuccess, self.payRequest.shippingMethods, self.payRequest.paymentSummaryItems);
}


#pragma mark -送货方式回调


- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller
                   didSelectShippingMethod:(PKShippingMethod *)shippingMethod
                                completion:(void (^)(PKPaymentAuthorizationStatus, NSArray<PKPaymentSummaryItem *> * _Nonnull))completion{
    //配送方式回调，如果需要根据不同的送货方式进行支付金额的调整，比如包邮和付费加速配送，可以实现该代理
//    PKShippingMethod *oldShippingMethod = [self.payRequest.shippingMethods objectAtIndex:2];
//    PKPaymentSummaryItem *total = [summaryItems lastObject];
//    total.amount = [total.amount decimalNumberBySubtracting:oldShippingMethod.amount];
//    total.amount = [total.amount decimalNumberByAdding:shippingMethod.amount];
//    
//    [summaryItems replaceObjectAtIndex:2 withObject:shippingMethod];
//    [summaryItems replaceObjectAtIndex:3 withObject:total];
//    
    completion(PKPaymentAuthorizationStatusSuccess, self.payRequest.paymentSummaryItems);
}


#pragma mark -支付卡选择回调

-(void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didSelectPaymentMethod:(PKPaymentMethod *)paymentMethod completion:(void (^)(NSArray<PKPaymentSummaryItem *> * _Nonnull))completion{
    //支付银行卡回调，如果需要根据不同的银行调整付费金额，可以实现该代理
    completion(self.payRequest.paymentSummaryItems);
}



-(void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didSelectShippingAddress:(ABRecordRef)address completion:(void (^)(PKPaymentAuthorizationStatus, NSArray<PKShippingMethod *> * _Nonnull, NSArray<PKPaymentSummaryItem *> * _Nonnull))completion{
    //送货地址回调，已弃用
}

#pragma mark -付款成功苹果服务器返回信息回调，做服务器验证

- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller
                       didAuthorizePayment:(PKPayment *)payment
                                completion:(void (^)(PKPaymentAuthorizationStatus status))completion {
    
    PKPaymentToken *payToken = payment.token;
    //支付凭据，发给服务端进行验证支付是否真实有效
    PKContact *billingContact = payment.billingContact;     //账单信息
    PKContact *shippingContact = payment.shippingContact;   //送货信息
    PKContact *shippingMethod = payment.shippingMethod;     //送货方式
    //等待服务器返回结果后再进行系统block调用
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //模拟服务器通信
        completion(PKPaymentAuthorizationStatusSuccess);
    });
    
    
}

#pragma mark - 支付完成回调
- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller{
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    self.applePayCompletion(YES);
}





@end
