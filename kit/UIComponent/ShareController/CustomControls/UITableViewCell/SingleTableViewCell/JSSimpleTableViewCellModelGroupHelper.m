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
                 @"DatePickerView":@[
                         
                                                     @{
                                                         @"title":@"DatePicker",
                                                         @"iconUrl" : @"home_highlight",
                                                         @"ctrl":@"",
                                                         @"flag":@"1"
                                                       },
                                                      @{
                                                         @"title":@"PickerView",
                                                         @"iconUrl" : @"home_highlight",
                                                         @"ctrl":@"",
                                                         @"flag":@"1"
                                                        }
                                                     
                                     ]
                },
             
             @{
                 @"UITabbar":@[
                         
                                                        @{
                                                        @"title":@"显示Tabbar Badge",
                                                        @"iconUrl" : @"home_highlight",
                                                        @"ctrl":@"",
                                                        @"flag":@"1"
                                                        },
                                                        @{
                                                        @"title":@"显示Tabbar Badge 带动画",
                                                        @"iconUrl" : @"home_highlight",
                                                        @"ctrl":@"",
                                                        @"flag":@"1"
                                                        },
                                                        @{
                                                            @"title":@"隐藏Tabbar Badge",
                                                            @"iconUrl" : @"home_highlight",
                                                            @"ctrl":@"",
                                                            @"flag":@"1"
                                                        }

                                  ]
                 },
             
             @{
                 @"商品详情":@[

                                @{
                                @"title":@"商品详情",
                                @"iconUrl" : @"home_highlight",
                                @"ctrl":@"HomeDetailViewController",
                                @"flag":@"1"
                                },
                                @{
                                @"title":@"FB登陆",
                                @"iconUrl" : @"home_highlight",
                                @"ctrl":@"JSLoginViewController",
                                @"flag":@"1"
                                },     @{
                                @"title":@"热门国家",
                                @"iconUrl" : @"home_highlight",
                                @"ctrl":@"JSMJNIndexTableViewController",
                                @"flag":@"1"
                                }

                         ]
                 },
             
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
