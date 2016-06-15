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
                 @"title":@"Home",
                 @"iconUrl" : @"home_highlight",
                 @"ctrl":@"TestViewController",
                 @"flag":@"1"
                 },
             @{
                 @"title":@"Notificatioins",
                 @"iconUrl" : @"home_highlight",
                 @"ctrl":@"AcountViewController",
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

-(NSArray<JSSimpleTableViewCellModelFrame *> *)singleTableViewModel{
    if (_singleTableViewModel==nil) {
        
        NSMutableArray<JSSimpleTableViewCellModelFrame *> *arr=[NSMutableArray array];
        NSArray *date=[self singleDataSoures];
        for (NSDictionary *dic in date) {
            JSSimpleTableViewCellModel *model = [JSSimpleTableViewCellModel objectWithKeyValues:dic];
            JSSimpleTableViewCellModelFrame *frameModel=[[JSSimpleTableViewCellModelFrame alloc] initWithModel:model];
            [arr addObject:frameModel];
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
