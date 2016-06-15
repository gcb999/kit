//
//  JSTabBarControllerConfig+Badge.h
//  kit
//
//  Created by gcb999 on 16/6/14.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabBarControllerConfig.h"

@interface JSTabBarControllerConfig (Badge)

#pragma mark -show badge
-(void)showBadgeWithStyle:(WBadgeStyle)style badge:(NSInteger)badge tabbarIndex:(NSInteger)index animationType:(WBadgeAnimType)aniType;


#pragma mark -hidden badge
-(void)hiddenBageWithTabbarIndex:(NSInteger)index;

@end
