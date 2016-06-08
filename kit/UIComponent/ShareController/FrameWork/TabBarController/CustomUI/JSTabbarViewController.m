//
//  JSTabbarViewController.m
//  kit
//
//  Created by gcb999 on 16/6/8.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabbarViewController.h"
#define kJSTabbarHeight 49

@interface JSTabbarViewController ()<JSTabbarDelegate>


@property(nonatomic,strong)NSArray < JSTabbarItemModel *> *items;

@end

@implementation JSTabbarViewController

- (void)viewDidLoad {
  
    
    [super viewDidLoad];
    

    
    //添加ContentView
    [self.view addSubview:self.contentView];
    
    //添加Tabbar
    [self.view addSubview:self.tabbar];
    
//    [self tabbarItemChangeFrom:0 to:0 ];
    
    
    
}

#pragma mark 添加子控制器和item
- (void)addController:(UIViewController *)vc title:(NSString *)title normal:(NSString *)normal highlighted:(NSString *)highlighted {
  
    
    // 设置控制器的标题
    vc.title = title;
    
    // 包装控制器
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc];
    
    nav1.delegate = self;
    
    // 对子控制器做了一次retain
    [self addChildViewController:nav1];
   
}

#pragma mark - JSTabbar的代理方法
// 在这里切换子控制器
- (void)tabbarItemChangeFrom:(NSInteger)from to:(NSInteger)to {
    // 取出旧控制器
    UIViewController *old = [self.childViewControllers objectAtIndex:from];
    // 移除旧控制器的view
    [old.view removeFromSuperview];
    
    // 取出新控制器
    UIViewController *new = [self.childViewControllers objectAtIndex:to];
    new.view.frame = _contentView.bounds;
    // 添加新控制器的view
    [_contentView addSubview:new.view];
    
    // 执行动画
    if (from != to) {
        CATransition *anim = [CATransition animation];
        anim.duration = 0.15;
        anim.type = kCATransitionPush;
        anim.subtype = (to > from)?kCATransitionFromRight:kCATransitionFromLeft;
        [_contentView.layer addAnimation:anim forKey:nil];
    }
}






#pragma mark -UI Getter

-(UIView *)contentView{
    if (_contentView==nil) {
        CGSize size = self.view.bounds.size;
        _contentView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height - kJSTabbarHeight)];
        _contentView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    }
    return _contentView;
}



-(JSTabbar *)tabbar{
    if (_tabbar==nil) {
        CGSize size = self.view.bounds.size;
        CGRect frame = CGRectMake(0, size.height - kJSTabbarHeight, size.width, kJSTabbarHeight);
         _tabbar = [[JSTabbar alloc] initWithFrame:frame items:self.items];
        // 设置代理
        _tabbar.delegate = self;
    
    }
    return _tabbar;
}

-(NSArray<JSTabbarItemModel *> *)items{
    
    if (_items==nil) {
 
        NSMutableArray<JSTabbarItemModel *> *arr=[NSMutableArray array];
        //1:读取配置文件
        NSString *content= [self readBundleFileName:@"JSTabBarControllerConfig.json"];
        NSDictionary *contentDic= [content JSONObject];
        if (IS_NSDictionary(contentDic)) {
            NSArray *contentArr=contentDic[@"content"];
            if (IS_NSArray(contentArr)) {
                for (NSDictionary *dic in contentArr) {
                    JSTabbarItemModel *model = [JSTabbarItemModel objectWithKeyValues:dic];
                   [ arr addObject:model];
                }
                
                
            }
            
        }
        _items=arr;
  
    }
    return _items;
    
}

@end
