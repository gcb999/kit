//
//  JSTabbarViewController+Badge.h
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabbarViewController.h"

@interface JSTabbarViewController (Badge)


#pragma mark -show badge
-(void)showBadge:(NSString *)badge tabbarIndex:(NSInteger)index Animation:(BOOL)animation;


#pragma mark -hidden badge
-(void)hideBageWithTabbarIndex:(NSInteger)index;

@end
