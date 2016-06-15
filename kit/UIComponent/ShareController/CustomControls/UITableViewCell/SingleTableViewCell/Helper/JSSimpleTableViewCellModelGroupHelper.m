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
                                }

                         ]
                 },
             
             @{
                 @"导航栏滚动用法":@[
                         
                         @{
                             @"title":@"TableView导航栏滚动隐藏",
                             @"iconUrl" : @"home_highlight",
                             @"ctrl":@"AcountViewController",
                             @"flag":@"1"
                             },
                         @{
                             @"title":@"TableView分组导航栏滚动隐藏",
                             @"iconUrl" : @"home_highlight",
                             @"ctrl":@"JSMJNIndexTableViewController",
                             @"flag":@"1"
                             },
                         @{
                             @"title":@"UICollectionView导航栏滚动隐藏",
                             @"iconUrl" : @"home_highlight",
                             @"ctrl":@"HomeViewController",
                             @"flag":@"1"
                             }
                         ,
                         @{
                             @"title":@"UISCrollerView 导航栏滚动隐藏",
                             @"iconUrl" : @"home_highlight",
                             @"ctrl":@"TestViewController",
                             @"flag":@"1"
                             }
                         
                         ]
                 },
             
             ];
    
}


#pragma mark -分组模型 (可以配置，也可以自己设置）

-( NSDictionary<NSString *,NSArray<JSSimpleTableViewCellModelFrame*> *> *)groupTableViewModels{
    if (_groupTableViewModels==nil) {
        
        NSMutableDictionary<NSString *,NSArray<JSSimpleTableViewCellModelFrame *> *> *tempDic=[NSMutableDictionary dictionary];
        
        NSArray *datas=[self groupDataSoures];
        
        for (NSDictionary * sectionDic in datas) {
            NSString *key=[sectionDic.allKeys lastObject];
            
            NSMutableArray<JSSimpleTableViewCellModelFrame*> *tempArr=[NSMutableArray array];
            for (NSDictionary *dic in sectionDic[key]) {
                JSSimpleTableViewCellModel *model = [JSSimpleTableViewCellModel objectWithKeyValues:dic];
                JSSimpleTableViewCellModelFrame *frameModel=[[JSSimpleTableViewCellModelFrame alloc] initWithModel:model];
                [tempArr addObject:frameModel];
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
