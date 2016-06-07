//
//  HomeDetailViewController.m
//  kit
//
//  Created by gcb999 on 16/6/7.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "HomeDetailViewController.h"


@interface HomeDetailViewController ()

@property(nonatomic,strong)JSItemImageViewController *itemImageViewController;

@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *   imagesURLStrings = @[
                                    @"http://images.cnitblog.com/blog/215975/201405/311744526507841.png",
                                    @"http://pic.cnblogs.com/avatar/291306/20150909092523.png"
                                    
                                    ];
      self.itemImageViewController=[[JSItemImageViewController alloc] initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 200) smallImgUrl:imagesURLStrings bigImgUrl:imagesURLStrings];
     
    [self.view addSubview:self.itemImageViewController.view];
    [self addChildViewController:self.itemImageViewController];

}

#pragma mark -getter





@end
