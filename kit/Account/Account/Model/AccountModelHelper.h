//
//  AccountModelHelper.h
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountModel.h"

@interface AccountModelHelper : NSObject

//1: 分组
@property (nonatomic, strong,readonly)NSDictionary<NSString *,NSArray<AccountModel*> *>   *accountGroupModels;

//2：单行
@property (nonatomic, strong,readonly)NSArray<AccountModel*>  *accountSingleModels;

+(instancetype) shareInstance;

@end
