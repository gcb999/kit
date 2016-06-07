//
//  LeftCollectionViewCell.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/23.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "LeftTableViewCell.h"

@implementation LeftTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        NSString *text=@"";
    }
    return self;
}



-(void)JSTableViewController:(JSTableViewController *)JSCtrl TableViewDateArr:(NSArray *)dateArr content:(id)content indexPath:(NSIndexPath *)indexpath{
    self.textLabel.text=@"dd";
    
    
    
}

@end
