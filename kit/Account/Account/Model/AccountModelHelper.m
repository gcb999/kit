//
//  AccountModelHelper.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "AccountModelHelper.h"

@implementation AccountModelHelper
@synthesize accountGroupModels=_accountGroupModels;
@synthesize accountSingleModels=_accountSingleModels;


/*------------------------------------------1：分组配置----------------------------------------------------------*/
#pragma mark -配置数据源

-(NSArray *)groupDataSoures{
    
    return @[
             
             @{
                 @"section":@[
                            @{
                                @"title":@"Notificatioins",
                                @"iconUrl" : @"home_highlight",
                                @"ctrl":@"JSLoginViewController",
                                @"flag":@"1"
                            }
                            ]
             },
            @{
                 @"section1":@[
                             @{
                                 @"title":@"Coupon",
                                 @"iconUrl" : @"home_highlight",
                                 @"ctrl":@"BrandCtrl",
                                 @"flag":@"1"
                             },
                             @{
                                 @"title":@"My Wallet",
                                 @"iconUrl" : @"home_highlight",
                                 @"ctrl":@"BrandCtrl",
                                 @"flag":@"1"
                             },
                             @{
                                 @"title":@"My History",
                                 @"iconUrl" : @"home_highlight",
                                 @"ctrl":@"BrandCtrl",
                                 @"flag":@"1"
                             }
                             ]
             },
             @{
                 @"section2":@[
                             @{
                                 @"title":@"Address Book",
                                 @"iconUrl" : @"home_highlight",
                                 @"ctrl":@"BrandCtrl",
                                 @"flag":@"1"
                             },
                             @{
                                 @"title":@"My Invitation",
                                 @"iconUrl" : @"home_highlight",
                                 @"ctrl":@"BrandCtrl",
                                 @"flag":@"1"
                             },
                             @{
                                 @"title":@"Setting",
                                 @"iconUrl" : @"home_highlight",
                                 @"ctrl":@"BrandCtrl",
                                 @"flag":@"1"
                             }
                             ]
             }
             
             
             ];
    
}


#pragma mark -分组模型

-( NSDictionary<NSString *,NSArray<AccountModel*> *> *)accountGroupModels{
    if (_accountGroupModels==nil) {
        
        NSMutableDictionary<NSString *,NSArray<AccountModel *> *> *tempDic=[NSMutableDictionary dictionary];
       
        NSArray *datas=[self groupDataSoures];

        for (NSDictionary * sectionDic in datas) {
            NSString *key=[sectionDic.allKeys lastObject];
            
            NSMutableArray<AccountModel*> *tempArr=[NSMutableArray array];
            for (NSDictionary *dic in sectionDic[key]) {
                AccountModel *model = [AccountModel objectWithKeyValues:dic];
                [tempArr addObject:model];
            }
            [tempDic addEntriesFromDictionary: @{key:tempArr}];
        }
        _accountGroupModels=tempDic;
        
    }
    
    return _accountGroupModels;
}



/*------------------------------------------单行配置----------------------------------------------------------*/

#pragma mark -单租配置

-(NSArray *)singleDataSoures{
    
    return @[
                @{
                @"title":@"Notificatioins",
                @"iconUrl" : @"home_highlight",
                @"ctrl":@"JSLoginViewController",
                @"flag":@"1"
                },
                @{
                @"title":@"Notificatioins",
                @"iconUrl" : @"home_highlight",
                @"ctrl":@"JSLoginViewController",
                @"flag":@"1"
                },
                @{
                @"title":@"Notificatioins",
                @"iconUrl" : @"home_highlight",
                @"ctrl":@"JSLoginViewController",
                @"flag":@"1"
                },
                @{
                @"title":@"Notificatioins",
                @"iconUrl" : @"home_highlight",
                @"ctrl":@"JSLoginViewController",
                @"flag":@"1"
                },
                @{
                @"title":@"Notificatioins",
                @"iconUrl" : @"home_highlight",
                @"ctrl":@"JSLoginViewController",
                @"flag":@"1"
                },
                @{
                @"title":@"Notificatioins",
                @"iconUrl" : @"home_highlight",
                @"ctrl":@"JSLoginViewController",
                @"flag":@"1"
                },
                @{
                @"title":@"Notificatioins",
                @"iconUrl" : @"home_highlight",
                @"ctrl":@"JSLoginViewController",
                @"flag":@"1"
                },
                @{
                @"title":@"Notificatioins",
                @"iconUrl" : @"home_highlight",
                @"ctrl":@"JSLoginViewController",
                @"flag":@"1"
                }

                   
            ];
    
}

-(NSArray<AccountModel *> *)accountSingleModels{
    if (_accountSingleModels==nil) {
        
        NSMutableArray<AccountModel *> *arr=[NSMutableArray array];
        NSArray *date=[self singleDataSoures];
        for (NSDictionary *dic in date) {
            AccountModel *model = [AccountModel objectWithKeyValues:dic];
            [arr addObject:model];
        }
        
        _accountSingleModels=arr;
        
    }
    return _accountSingleModels;
}





/*------------------------------------------单例----------------------------------------------------------*/

#pragma mark -单例类
static  AccountModelHelper* _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [AccountModelHelper shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [AccountModelHelper shareInstance] ;
}





@end
