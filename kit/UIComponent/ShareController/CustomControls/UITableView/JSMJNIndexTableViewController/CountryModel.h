//
//  CountryModel.h
//  SailvanElec
//
//  Created by gcb999 on 16/6/2.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CountryModel : NSObject


@property(nonatomic,copy)NSString *iconUrl;

@property (nonatomic , copy) NSString *countryName;

@property (nonatomic , copy) NSString *indexLetter;



- (id)initWithDictionary:(NSDictionary *)dic;


@end
