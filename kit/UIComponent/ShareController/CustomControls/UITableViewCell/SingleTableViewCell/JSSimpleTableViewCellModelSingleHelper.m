//
//  JSSimpleTableViewCellModelSingleHelper.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSSimpleTableViewCellModelSingleHelper.h"

@implementation JSSimpleTableViewCellModelSingleHelper

#pragma mark -读取配置文件
-(NSArray *)singleDataSoures{
    
    return @[
             @{
                 @"title":@"第三方登陆（FB登陆用法）",
                 @"iconUrl" : @"home_highlight",
                 @"ctrl":@"JSLoginViewController",
                 @"flag":@"1"
                 },
             @{
                 @"title":@"动画Transation (UIPicker)",
                 @"iconUrl" : @"home_highlight",
                 @"ctrl":@"AnimationViewController",
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


#pragma mark -getter

-(NSArray<JSSimpleTableViewCellModel *> *)singleTableViewModel{
    if (_singleTableViewModel==nil) {
        
        NSMutableArray<JSSimpleTableViewCellModel *> *arr=[NSMutableArray array];
        NSArray *date=[self singleDataSoures];
        for (NSDictionary *dic in date) {
            JSSimpleTableViewCellModel *model = [JSSimpleTableViewCellModel objectWithKeyValues:dic];
            [arr addObject:model];
        }
        
        _singleTableViewModel=arr;
        
    }
    return _singleTableViewModel;
}









/*------------------------------------------单例----------------------------------------------------------*/

#pragma mark -单例类
static  JSSimpleTableViewCellModelSingleHelper* _instance = nil;

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
    return [JSSimpleTableViewCellModelSingleHelper shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [JSSimpleTableViewCellModelSingleHelper shareInstance] ;
}
@end
