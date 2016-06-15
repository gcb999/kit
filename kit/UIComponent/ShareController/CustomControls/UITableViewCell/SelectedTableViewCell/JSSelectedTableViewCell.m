//
//  JSSelectedTableViewCell.m
//  kit
//
//  Created by gcb999 on 16/6/15.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSSelectedTableViewCell.h"

@interface JSSelectedTableViewCell ()



@property (nonatomic , strong) UIImageView *bgImageView;

@property (nonatomic , strong) UIImageView *iconImageView;

@property (nonatomic , strong) UILabel *titleLabel;

@property (nonatomic , strong) UIImageView *selelctedImageView;

@property (nonatomic , strong) JSSelectedTableViewCellModelFrame *modelFrame;

@end


@implementation JSSelectedTableViewCell

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
        
        
        //选择图片
        self.selelctedImageView=[UIImageView ImageViewImageName:@"adressBtnSeleted" frame:CGRectZero];
        [self.contentView addSubview:self.selelctedImageView];
        
      
        
        
    }
    return self;
}

#pragma mark - 分组
-(void)JSTableViewController:(JSTableViewController *)JSCtrl sections:(NSArray *)sections rowsOfSections:(NSDictionary<NSString *,NSArray *> *)rowsOfSections content:(id)content indexPath:(NSIndexPath *)indexpath{
    
    
    self.modelFrame=content;
    self.titleLabel.text=self.modelFrame.model.title;

  
        [self loadingSmallPlaceholderImageName:self.modelFrame.model.iconUrl imgview:self.iconImageView];
  
    
    //accountarrow
    self.selelctedImageView.image = [UIImage imageNamed:@"accountarrow"];
    
}

#pragma mark - 单个
-(void)JSTableViewController:(JSTableViewController *)JSCtrl TableViewDateArr:(NSArray *)dateArr content:(id)content indexPath:(NSIndexPath *)indexpath{
    self.modelFrame=content;
    self.titleLabel.text=self.modelFrame.model.title;
//    self.iconImageView.image=[UIImage imageNamed:self.modelFrame.model.iconUrl];
    [self loadingSmallPlaceholderImageName:self.modelFrame.model.iconUrl imgview:self.iconImageView];
    
    if (self.modelFrame.model.flag) {
        self.selelctedImageView.image=[UIImage imageNamed:@"adressBtnSeleted"];
    }
    else{
        self.selelctedImageView.image=[UIImage imageNamed:@"adressBtnUnSeleted"];
    }
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
    self.selelctedImageView.frame=self.modelFrame.selelctedImageView_Frame;    
    
    
    
}


@end
