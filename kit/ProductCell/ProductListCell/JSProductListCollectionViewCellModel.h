//
//  JSProductListCollectionViewCellModel.h
//  SailvanElec
//
//  Created by gcb999 on 16/6/1.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSBaseProductCollectionCellModel.h"

@interface JSProductListCollectionViewCellModel : JSBaseProductCollectionCellModel


#pragma mark - Edit和Buy
@property(nonatomic,assign)BOOL is_edit_buy;

-(JSProductListCollectionViewCellModel *)initWithDic:(NSDictionary *)dic;

@end
