//
//  BaseTableViewCellDelegate.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/21.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSTableViewCellDelegate <NSObject>

//单行
-(void)JSTableViewController:(JSTableViewController *)JSCtrl   TableViewDateArr:(NSArray *)dateArr content:(id)content indexPath:(NSIndexPath *)indexpath;

//分组
-(void)JSTableViewController:(JSTableViewController *)JSCtrl   sections:(NSArray *)sections rowsOfSections:(NSDictionary<NSString *,NSArray *> *)rowsOfSections content:(id)content indexPath:(NSIndexPath *)indexpath;



@end
