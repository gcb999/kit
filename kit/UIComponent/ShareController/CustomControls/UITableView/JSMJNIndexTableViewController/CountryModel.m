//
//  CountryModel.m
//  SailvanElec
//
//  Created by gcb999 on 16/6/2.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "CountryModel.h"

@interface CountryModel ()

@property(nonatomic,strong)NSArray *indexArray;


@end



@implementation CountryModel

- (id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        
        self.countryName=dic[@"country_name"];
        self.indexLetter=[self.countryName substringWithRange:NSMakeRange(0, 1)];
            
        
        }
    return self;

}



@end
