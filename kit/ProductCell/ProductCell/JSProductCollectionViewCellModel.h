//
//  JSProductCollectionViewCellModel.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/31.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSBaseProductCollectionCellModel.h"

@interface JSProductCollectionViewCellModel : JSBaseProductCollectionCellModel

-(JSProductCollectionViewCellModel *)initWithDic:(NSDictionary *)dic;



#pragma mark - 7: Edit和Buy
@property(nonatomic,assign)BOOL is_edit_buy;





@end
