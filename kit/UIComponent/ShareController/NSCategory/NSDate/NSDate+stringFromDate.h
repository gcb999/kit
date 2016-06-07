//
//  NSDate+stringFromDate.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/31.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (stringFromDate)
#pragma mark - 日期装换字符串

-(NSString *)stringFromDate:(NSDate *)currentDate;

-(NSString *)stringFromDate:(NSDate *)currentDate dateFormat:(NSString *)dateFormat;



@end
