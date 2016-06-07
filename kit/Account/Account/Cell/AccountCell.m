//
//  AccountCell.m
//  UIComponent
//
//  Created by gcb999 on 16/6/6.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "AccountCell.h"


@interface AccountCell ()

@property (nonatomic , strong) UIImageView *bgImageView;
@property (nonatomic , strong) UIImageView *iconImageView;
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UIImageView *JTImageView;
@property(nonatomic,strong)AccountModel *model;

@end


@implementation AccountCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //背景图片
        self.bgImageView=[UIImageView ImageViewImageName:@"" frame:CGRectZero];
        [self.contentView addSubview:self.bgImageView];
        //图片
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
    
    
    self.model=content;
    self.titleLabel.text=self.model.title;
    self.iconImageView.image=[UIImage imageNamed:self.model.iconUrl];
    //accountarrow
    self.JTImageView.image = [UIImage imageNamed:@"accountarrow"];
    
}

#pragma mark - 单个
-(void)JSTableViewController:(JSTableViewController *)JSCtrl TableViewDateArr:(NSArray *)dateArr content:(id)content indexPath:(NSIndexPath *)indexpath{
    self.model=content;
    self.titleLabel.text=self.model.title;
     self.iconImageView.image=[UIImage imageNamed:self.model.iconUrl];
    self.JTImageView.image = [UIImage imageNamed:@"accountarrow"];;
}




-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect lrect, rect=self.contentView.bounds;
    rect=UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(0, 5, 0, 0));
   
    //图标
    if (IS_NSString(self.model.iconUrl)) {
        CGRectDivide(rect, &lrect, &rect, 40, CGRectMinXEdge);
        self.iconImageView.frame=[self centerForParentViewFrame:lrect subsize:CGSizeMake(30, 30)];
        
    }
    else{
        self.iconImageView.frame=CGRectZero;
         CGRectDivide(rect, &lrect, &rect, 10, CGRectMinXEdge);
        
    }
    
 //标题和箭头
    if(self.model.flag){
        
        CGFloat width =rect.size.width-40;
        CGRectDivide(rect, &lrect, &rect, width, CGRectMinXEdge);
        self.titleLabel.frame=lrect;
        self.JTImageView.frame=[self centerForParentViewFrame:rect subsize:CGSizeMake(12, 12)];
        
    }
    else{
        self.titleLabel.frame=rect;
        self.JTImageView.frame=CGRectZero;
    }
    
    
    
    
    
}




@end
