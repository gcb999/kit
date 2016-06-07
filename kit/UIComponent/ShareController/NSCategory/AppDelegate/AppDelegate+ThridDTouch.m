//
//  AppDelegate+ThridDTouch.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "AppDelegate+ThridDTouch.h"

@implementation AppDelegate (ThridDTouch)


#pragma mark - 集成3DTouch  Home Quick

-(void)Init3DTouchHomeQuick{
    
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"home_highlight.png"];//创建快捷item的icon即UIApplicationShortcutItemIconFile
    NSDictionary *info1 = @{@"scheme":@"devzeng://home"};//创建快捷item的userinfo即UIApplicationShortcutItemUserInfo
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"com.devzeng.home" localizedTitle:@"首页" localizedSubtitle:@"首页" icon:icon1 userInfo:info1];
    
    
    
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"account_highlight.png"];
    NSDictionary *info2 = @{@"scheme":@"devzeng://Account"};
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"com.devzeng.Account" localizedTitle:@"个人页面" localizedSubtitle:@"个人页面" icon:icon2 userInfo:info2];
    
    
    //创建ShortcutItem
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"account_normal.png"];
    NSDictionary *info3 = @{@"scheme":@"devzeng://help"};
    UIMutableApplicationShortcutItem *item3 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"com.devzeng.help" localizedTitle:@"同城" localizedSubtitle:@"同城" icon:icon3 userInfo:info3];
    //注册ShortcutItem
    [UIApplication sharedApplication].shortcutItems = @[item1,item2,item3];
}




- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler{
    if (shortcutItem) {
        //根据不同的Action响应不同的事件
        NSString *type=shortcutItem.type;
        if ([type isEqualToString:@"com.devzeng.home"]) {
            
        }
        else if ([type isEqualToString:@"com.devzeng.Account"]){
            
        }
        else if ([type isEqualToString:@"com.devzeng.help"]){
            
        }
        
    }
    if (completionHandler) {
        completionHandler(YES);
    }
}


@end
