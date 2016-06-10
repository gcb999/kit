//
//  JSSingleTableViewCellModelGroupHelper.h
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSSimpleTableViewCellModel.h"

@interface JSSimpleTableViewCellModelGroupHelper : NSObject

//1: 分组
@property (nonatomic, strong)NSDictionary<NSString *,NSArray<JSSimpleTableViewCellModel*> *>   *groupTableViewModels;


+(instancetype) shareInstance;

@end
