//
//  JSTabbarItem.h
//  kit
//
//  Created by gcb999 on 16/6/8.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSTabbarItemModel.h"


@interface JSTabbarItem : UIButton

- (id)initWithFrame:(CGRect)frame itemDesc:(JSTabbarItemModel *)desc;

@end
