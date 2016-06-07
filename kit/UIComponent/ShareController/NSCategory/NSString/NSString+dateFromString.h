//
//  NSString+dateFromString.h
//  JSThridPod
//
//  Created by gcb999 on 16/5/18.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (dateFromString)

#pragma mark - 日期装换字符串

-(NSDate *)dateFromString;

-(NSDate *)dateFromFormat:(NSString *)dateFormat;



@end
