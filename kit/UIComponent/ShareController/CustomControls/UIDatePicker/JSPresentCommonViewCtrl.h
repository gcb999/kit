//
//  JSPresentCommonViewCtrl.h
//  JiangSuTax
//
//  Created by Jobs on 13-6-3.
//  Copyright (c) 2013年 apple user. All rights reserved.
//

#import <UIKit/UIKit.h>


@class JSPresentCommonViewCtrl;


typedef void(^SelectBlock)(JSPresentCommonViewCtrl *ctrl ,NSString *text);



@interface JSPresentCommonViewCtrl : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>{
    
    UIPickerView *pkView;
    UIDatePicker *datePkView;
    
    
    NSMutableArray *pkDataArray;
    int selectIndex;
    
    int viewType;

}

@property(nonatomic,copy)SelectBlock  selectBlock;


-(void)pickerViewWithDataArr:(NSArray *)dataArr selectBlock:(SelectBlock)selectBlock;

-(void)datePickWithSelectBlock:(SelectBlock)selectBlock;





@end


