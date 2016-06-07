//
//  JSPayPal.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSPayPal.h"

#import "JSUserSingletonModel.h"

NSString *const JSProductName = @"JSProductName";
NSString *const JSQuantity = @"JSQuantity";
NSString *const JSPrice = @"JSPrice";
NSString *const JSCurrency = @"JSCurrency";
NSString *const JSSKU = @"JSSKU";

@implementation JSPayPal


+(JSPayPal*)share{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
        
    });
    return _sharedObject;
}


#pragma mark -初始化  client ID

-(void)initPayPalMobile{
    [PayPalMobile initializeWithClientIdsForEnvironments:@{PayPalEnvironmentProduction: @"AQg72DV8x7_dlIVp-fLqj3_VdSyFNbGvOaO3TQPzPS47gE26ROdH_FrgDz3T6z-GjAwyAq095DT9dwfZ",
                                                           PayPalEnvironmentSandbox : @"AZgeDQ-WJaAvudnnfn04HUXH1YGc61XRzDB3p21Srq-l-PK78nvYw3dDQAnHP9ntmWT_rbJLj_5jNEKS"
                                                           }];

}



#pragma mark --配置PayPal 环境

-(PayPalConfiguration *)payPalConfig{
 
        PayPalConfiguration * _payPalConfig=[[PayPalConfiguration alloc]init];
    
        _payPalConfig.acceptCreditCards = NO;//不接受信用卡
    
        _payPalConfig.languageOrLocale = @"en";
    
        _payPalConfig.merchantName = @"Shenzhen Sailvan Inc.";

        _payPalConfig.merchantPrivacyPolicyURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/privacy-full"];
        _payPalConfig.merchantUserAgreementURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/useragreement-full"];

        NSLog(@"PayPal iOS SDK version: %@", [PayPalMobile libraryVersion]);
        return _payPalConfig;
}



#pragma mark -  Create a PayPalPayment

-(PayPalPayment *)paymentWithOrderId:(NSString *)OrderId  subProductItems:(NSArray<NSDictionary *>*)subProductItems total:(NSString *)total shipping:(NSString *)_shipping tax:(NSString *)_tax{
   
    NSLog(@"\n===当前的货币是：%@",[JSUserSingletonModel share].currency);
    PayPalPayment* _payment=[[PayPalPayment alloc]init];
    
    _payment.currencyCode = @"USD";;//货币
        
    _payment.shortDescription=@"DealSale Shopping";//描述
  
    
   
    @try {
    
        //获取订单下子商品详情
        
        NSMutableArray<PayPalItem *> *items=[self payPalItems:subProductItems];
      
        if(items){
            _payment.items = items;  // if not including multiple items, then leave payment.items as nil
            
            
            //根据商品 获取subTotal
            NSDecimalNumber *subtotal = [PayPalItem totalPriceForItems:items];
    
            //运费
            _shipping=IS_NSString(_shipping)?_shipping:@"0";
            NSDecimalNumber *shipping = [[NSDecimalNumber alloc] initWithString:_shipping];
            
            //税收
            _tax=IS_NSString(_tax)?_tax:@"0";
            NSDecimalNumber *tax = [[NSDecimalNumber alloc] initWithString:_tax];
    
            PayPalPaymentDetails *paymentDetails = [PayPalPaymentDetails paymentDetailsWithSubtotal:subtotal
                                                                                       withShipping:shipping
                                                                                            withTax:tax];
             _payment.paymentDetails = paymentDetails;
            
           
        }
        
    } @catch (NSException *exception) {
        
        
    }
    

    
    _payment.amount=[[NSDecimalNumber alloc]initWithString:total];//钱
   
    _payment.custom=OrderId;//订单号
    

    return _payment;
}








#pragma mark -获取订单中子商品详情
-(NSMutableArray<PayPalItem *> *)payPalItems:( NSArray<NSDictionary *>  *)date{
    
    if(!IS_NSArray(date)){
        return   nil;
    }
    
    @try {

                    NSMutableArray<PayPalItem *> *payPalItems=[NSMutableArray<PayPalItem *>  array];

                    for (NSDictionary *dic in date) {

                    NSString *productName=[NSDictionary getStringByKey:dic Key:JSProductName];

                    NSString *quantity=[NSDictionary getStringByKey:dic Key:JSQuantity];

                    NSInteger Quantity=[quantity integerValue];

                    NSString *Price=[NSDictionary getStringByKey:dic Key:JSPrice];

                    NSString *Currency=[NSDictionary getStringByKey:dic Key:JSCurrency];

                    NSString *SKU=[NSDictionary getStringByKey:dic Key:JSSKU];

                    PayPalItem *item1 = [PayPalItem itemWithName:productName
                                                withQuantity:Quantity
                                                   withPrice:[NSDecimalNumber decimalNumberWithString:Price]
                                                withCurrency:Currency
                                                     withSku:SKU];
                    [payPalItems addObject:item1];
            }
                return payPalItems;

            } @catch (NSException *exception) {

                return nil;
            }
}


#pragma mark -支付界面


-(void)PayPalment:(PayPalPayment*) payment  currentCtrl:(UIViewController *)ctrl payPalCompletion: (void(^)(BOOL isSuccess , PayPalPayment *paypalment ))payPalCompletion{
    
    [PayPalMobile preconnectWithEnvironment:PayPalEnvironmentSandbox];
    
    PayPalConfiguration *config=[self payPalConfig];
    
    PayPalPaymentViewController *paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment
                                                                                                configuration:config
                                                                                                     delegate:self];
    
    [JSPayPal share].payPalCompletion=payPalCompletion;
    self.currentCtrl=ctrl;
    
    [ctrl presentViewController:paymentViewController animated:YES completion:^{
        
    }];
    
    
}



#pragma mark PayPalPaymentDelegate methods

- (void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController didCompletePayment:(PayPalPayment *)completedPayment {
    NSLog(@"PayPal Payment Success!");

  
    
   [JSPayPal share].payPalCompletion(YES,completedPayment);
    
    [self.currentCtrl dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

- (void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController  {
    NSLog(@"PayPal Payment Canceled");
     [JSPayPal share].payPalCompletion(NO,nil);
    
    [self.currentCtrl dismissViewControllerAnimated:YES completion:^{
        
    }];
}




@end
