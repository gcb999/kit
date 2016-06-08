//
//  JSTabBarControllerConfig.h
//  JSThridPod
//
//  Created by gcb999 on 16/4/19.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYLTabBarController.h"

@interface JSTabBarControllerConfig : NSObject
@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
+(instancetype) shareInstance;
@end
