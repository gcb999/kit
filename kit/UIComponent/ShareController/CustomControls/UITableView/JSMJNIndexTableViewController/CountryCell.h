//
//  CountryCell.h
//  SailvanElec
//
//  Created by gcb999 on 16/6/2.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryModel.h"
@interface CountryCell : UITableViewCell<JSTableViewCellDelegate>


@property(nonatomic,strong)CountryModel *model;
@end
