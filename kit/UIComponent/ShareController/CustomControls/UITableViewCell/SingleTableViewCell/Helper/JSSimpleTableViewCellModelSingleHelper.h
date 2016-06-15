//
//  JSSimpleTableViewCellModelSingleHelper.h
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSSimpleTableViewCellModelFrame.h"

@interface JSSimpleTableViewCellModelSingleHelper : NSObject

@property (nonatomic, strong)NSArray<JSSimpleTableViewCellModelFrame*>  *singleTableViewModel;

+(instancetype) shareInstance;

@end
