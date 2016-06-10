//
//  UIView+Badge.h
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,JSBadgeAnimType)
{
     JSBadgeAnimTypeNone = 0,
     JSBadgeAnimTypeScale
};

@interface UIView (Badge)

-(void)showBadge:(NSString *)badge animationType:(JSBadgeAnimType)animationType;

-(void)hideBadge;

@end
