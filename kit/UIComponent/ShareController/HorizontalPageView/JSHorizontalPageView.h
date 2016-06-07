//
//  JSNinaPagerViewConfig.h
//  JSThridPod
//
//  Created by gcb999 on 16/4/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NinaPagerView.h"





@interface JSHorizontalPageView : UIView


@property(nonatomic,strong)NinaPagerView *ninaPagerView;



//颜色集合
@property(nonatomic,strong)NSArray *colors;

//标题集合
@property(nonatomic,strong)NSArray *titles;

//控制器集合
@property(nonatomic,strong)NSArray *vcs;

//代理方法

@property(nonatomic,assign)id<NinaPagerViewDelegate> delegate;




- (instancetype)initWithFrame:(CGRect)frame  titles:(NSArray *)titles  vcs:(NSArray *)vcs  delegate:(id<NinaPagerViewDelegate>)delegate;


-(void) loadingConfig;


#pragma mark -添加选中按钮

-(void)selectedIndex:(NSInteger)index;




@end
