//
//  JSSingleTableVIewCellModel.h
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSSimpleTableViewCellModel : NSObject

@property(nonatomic,copy)NSString *iconUrl;//Url 大小 30*30

@property(nonatomic,copy)NSString *title;//标题

@property(nonatomic,copy)NSString *ctrl;//标题

@property(nonatomic,assign)BOOL flag;//标识,临时作用 大小12*12

@end
