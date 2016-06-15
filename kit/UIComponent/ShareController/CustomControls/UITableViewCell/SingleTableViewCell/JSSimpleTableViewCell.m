//
//  JSSingleTableVIewCell.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSSimpleTableViewCell.h"

@interface JSSimpleTableViewCell ()

@property (nonatomic , strong) UIImageView *bgImageView;
@property (nonatomic , strong) UIImageView *iconImageView;
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UIImageView *JTImageView;
@property (nonatomic , strong) JSSimpleTableViewCellModelFrame *modelFrame;

@end


@implementation JSSimpleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //背景图片
        self.bgImageView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        [self.contentView addSubview:self.bgImageView];
       
        //图标
        self.iconImageView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        [self.bgImageView addSubview:self.iconImageView];
        
        //名字
        self.titleLabel=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentLeft  font:KNormalFontSize];
        [self.bgImageView addSubview:self.titleLabel];
        
        
        //箭头
        self.JTImageView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        [self.contentView addSubview:self.JTImageView];
        
        //线
        
        
    }
    return self;
}

#pragma mark - 分组
-(void)JSTableViewController:(JSTableViewController *)JSCtrl sections:(NSArray *)sections rowsOfSections:(NSDictionary<NSString *,NSArray *> *)rowsOfSections content:(id)content indexPath:(NSIndexPath *)indexpath{
    
    
    self.modelFrame=content;
    self.titleLabel.text=self.modelFrame.model.title;
    [self loadingSmallPlaceholderImageName:self.modelFrame.model.iconUrl imgview:self.iconImageView];
    self.iconImageView.image=[UIImage imageNamed:self.modelFrame.model.iconUrl];
    //accountarrow
    self.JTImageView.image = [UIImage imageNamed:@"accountarrow"];
    
}

#pragma mark - 单个
-(void)JSTableViewController:(JSTableViewController *)JSCtrl TableViewDateArr:(NSArray *)dateArr content:(id)content indexPath:(NSIndexPath *)indexpath{
    self.modelFrame=content;
    self.titleLabel.text=self.modelFrame.model.title;
    [self loadingSmallPlaceholderImageName:self.modelFrame.model.iconUrl imgview:self.iconImageView];
    self.JTImageView.image = [UIImage imageNamed:@"accountarrow"];;
}




-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    //背景
    self.bgImageView.frame=self.modelFrame.bgImageView_Frame;
    
    //图标
    self.iconImageView.frame=self.modelFrame.iconImageView_Frame;
    
    //标题
    self.titleLabel.frame=self.modelFrame.titleLabel_Frame;
    
    //选择图标
    self.JTImageView.frame=self.modelFrame.jtImageView_Frame;
    
    
    
    
}




@end
