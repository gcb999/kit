//
//  JSFaceBook.m
//  kit
//
//  Created by gcb999 on 16/6/8.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSFaceBook.h"



@interface JSFaceBook ()<FBSDKSharingDelegate>

@property(nonatomic,copy)ShareCompleteBlock shareCompleteBlock;

@end

@implementation JSFaceBook




#pragma mark-  1：初始化方法 (appDelegate)

-(void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
}


- (BOOL)application:(UIApplication *)application   openURL:(NSURL *)url  openCtrlClass:(Class)openCtrlClass  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
   
    //处理FB Link
    
    if ([sourceApplication isEqualToString:@"com.facebook.Facebook"]) {
        BFURL *parsedUrl = [BFURL URLWithInboundURL:url sourceApplication:sourceApplication];
        NSURL *targetUrl = [parsedUrl targetURL];
        
        if (targetUrl && [targetUrl isKindOfClass:[NSURL class]]) {
            NSString *fullUrl=[targetUrl absoluteString];
            NSString *absoulutString = [fullUrl stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];;
            if ([absoulutString rangeOfString:@"spu="].location!=NSNotFound) {
                NSArray *temp=[absoulutString componentsSeparatedByString:@"spu="];
                if (temp && [temp isKindOfClass:[NSArray class]]) {
                    NSString *spu=[temp lastObject];
//                    
//                    NSArray<UIViewController *>* viewControllers=  [JSTabBarControllerConfig shareInstance].tabBarController.viewControllers;
//                    UINavigationController *nav= (UINavigationController *)viewControllers[0];
//                    if (openCtrlClass) {
//                        UIViewController *detailCtlr=(UIViewController *) [[openCtrlClass alloc] init];
//                        //detailCtlr.spu=spu;
//                        [nav pushViewController:detailCtlr animated:YES];
//                    }
                }
                
            }
            
        }
        
    }

    //返回数据
  return  [[FBSDKApplicationDelegate sharedInstance] application:application
                                                            openURL:url
                                                  sourceApplication:sourceApplication
                                                    annotation:annotation];
}


#pragma mark-  2: 登陆功能

-(void)loginFromViewController:(UIViewController *)fromViewController complete:(void (^)(JSFaceBookLoginState,id))complete{
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    if (![UIApplication.sharedApplication canOpenURL:[NSURL URLWithString:@"fb://"]])
    {
        login.loginBehavior = FBSDKLoginBehaviorWeb;
    }
    [login  logInWithReadPermissions: @[ @"email"]  fromViewController:fromViewController  handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {//错误
            
            complete(JSFaceBookLoginError,nil);
            
        } else if (result.isCancelled) {//取消
        
            complete(JSFaceBookLoginCancel,nil);
       
        } else {
            
            
            if ([result.grantedPermissions containsObject:@"email"]) {
                NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
                [parameters setValue:@"id,name,email" forKey:@"fields"];
                
                FBSDKGraphRequest *requestMe = [[FBSDKGraphRequest alloc]
                                                initWithGraphPath:@"me" parameters:parameters];
                
                FBSDKGraphRequestConnection *connection = [[FBSDKGraphRequestConnection alloc] init];
                [connection addRequest:requestMe
                     completionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                         
                         //NSString *emial = [result valueForKey:@"email"];

                         complete(JSFaceBookLoginOK,result)
                         ;
                     }];
                
                [connection start];
                
                
            }
        }
    }];

}



#pragma mark-  link分享


- (void)shareForFacebook:(NSString *)shareText shareImageUrl:(NSString *)imagePath ShareCompleteBlock:(ShareCompleteBlock)shareCompleteBlock
{
    if ([[FBSDKAccessToken currentAccessToken] hasGranted:@"publish_actions"]) {
        
        
        
        NSLog(@"has Publish_actions permission");
        
        self.shareCompleteBlock=shareCompleteBlock;
        
        FBSDKShareLinkContent *linkContent = [[FBSDKShareLinkContent alloc] init];
        
        linkContent.contentTitle = @"DressLink";
        
        linkContent.contentDescription = shareText;
        
        //自定义link(在后缀中加入SPU)
        NSString *url=[NSString stringWithFormat:@"%@?spu=%@",FBAPPLINK,@"spu"];
        linkContent.contentURL = [NSURL URLWithString:url];
        
        NSURL *imgUrl= [NSURL URLWithString:imagePath];
        if (imgUrl.absoluteString.length>5) {
            linkContent.imageURL = [NSURL URLWithString:imagePath];
        }
        
        //开始分享
        [FBSDKShareAPI shareWithContent:linkContent delegate:self];
        
        
        
     
        
        
    }else{
        
        FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
        if (![UIApplication.sharedApplication canOpenURL:[NSURL URLWithString:@"fb://"]])
        {
            loginManager.loginBehavior = FBSDKLoginBehaviorWeb;
        }
        [loginManager logInWithPublishPermissions:@[@"publish_actions"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
            
            if (error) {
                
                NSLog(@"error message:%@",error.description);
                
            }
            
        }];
    }
}



#pragma mark-  登出
-(void)logout{
    
//    [[FBSDKLoginManager alloc] init] 
}


#pragma mark - FBSDKSharingDelegate

- (void) sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results {
    
    //成功
    self.shareCompleteBlock(JSFaceBookShareOK);
}

- (void) sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error {
    //失败
    self.shareCompleteBlock(JSFaceBookShareError);
}

- (void) sharerDidCancel:(id<FBSDKSharing>)sharer {
    
    //取消
    self.shareCompleteBlock(JSFaceBookShareCancel);
    
}



#pragma mark -单例类
static JSFaceBook * _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [JSFaceBook shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [JSFaceBook shareInstance] ;
}

@end
