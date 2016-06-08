//
//  JSSingletonModel.m
//  kit
//
//  Created by gcb999 on 16/6/8.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSSingletonModel.h"

@implementation JSSingletonModel


#pragma mark -单例类
static JSSingletonModel * _instance = nil;

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
    return [JSSingletonModel shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [JSSingletonModel shareInstance] ;
}

@end
