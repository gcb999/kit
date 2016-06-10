//
//  JSSingleTableViewCellModelGroupHelper.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSSimpleTableViewCellModelGroupHelper.h"


@implementation JSSimpleTableViewCellModelGroupHelper


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


#pragma mark -分组模型 (可以配置，也可以自己设置）

-( NSDictionary<NSString *,NSArray<JSSimpleTableViewCellModel*> *> *)groupTableViewModels{
    if (_groupTableViewModels==nil) {
        
        NSMutableDictionary<NSString *,NSArray<JSSimpleTableViewCellModel *> *> *tempDic=[NSMutableDictionary dictionary];
        
        NSArray *datas=[self groupDataSoures];
        
        for (NSDictionary * sectionDic in datas) {
            NSString *key=[sectionDic.allKeys lastObject];
            
            NSMutableArray<JSSimpleTableViewCellModel*> *tempArr=[NSMutableArray array];
            for (NSDictionary *dic in sectionDic[key]) {
                JSSimpleTableViewCellModel *model = [JSSimpleTableViewCellModel objectWithKeyValues:dic];
                [tempArr addObject:model];
            }
            [tempDic addEntriesFromDictionary: @{key:tempArr}];
        }
        _groupTableViewModels=tempDic;
        
    }
    
    return _groupTableViewModels;
}



/*------------------------------------------单例----------------------------------------------------------*/

#pragma mark -单例类
static  JSSimpleTableViewCellModelGroupHelper* _instance = nil;

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
    return [JSSimpleTableViewCellModelGroupHelper shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [JSSimpleTableViewCellModelGroupHelper shareInstance] ;
}



@end
