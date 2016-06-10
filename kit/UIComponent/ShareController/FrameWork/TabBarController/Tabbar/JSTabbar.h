//
//  JSTabbar.h
//  kit
//
//  Created by gcb999 on 16/6/8.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSTabbarItem.h"


@protocol JSTabbarDelegate <NSObject>
- (void)tabbarItemChangeFrom:(NSInteger)from to:(NSInteger)to;
@end


@interface JSTabbar : UIView

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray<JSTabbarItemModel *> *)items;

@property (nonatomic, assign) id<JSTabbarDelegate> delegate;

#pragma mark -得到当前对应item

-(JSTabbarItem *)tabbarItem:(NSInteger)index;

@end
