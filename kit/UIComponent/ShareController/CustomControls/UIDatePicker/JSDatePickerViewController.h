//
//  JSDatePickerViewController.h
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSDatePickerViewController;

typedef void(^datePickerCompleteBlock)(JSDatePickerViewController *datePickerCtrl ,NSString *text);

@interface JSDatePickerViewController : UIViewController

-(instancetype)initWitHeight:(CGFloat)height complete:(datePickerCompleteBlock)complete;

@property(nonatomic,copy)datePickerCompleteBlock block;

@property(nonatomic,strong)   UIDatePicker* datePkView;;

@end
