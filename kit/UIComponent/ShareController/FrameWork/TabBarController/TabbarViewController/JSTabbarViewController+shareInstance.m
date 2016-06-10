//
//  JSTabbarViewController+shareInstance.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabbarViewController+shareInstance.h"

@implementation JSTabbarViewController (shareInstance)

#pragma mark -单例类
static  JSTabbarViewController* _instance = nil;

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
    return [JSTabbarViewController shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [JSTabbarViewController shareInstance] ;
}


@end
