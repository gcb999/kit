//
//  JSPickerViewController.h
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSPickerViewController;

typedef void(^pickerViewCompleteBlock)(JSPickerViewController *pickerViewCtrl ,NSString *text);

@interface JSPickerViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

- (instancetype)initWithData:(NSArray *)dataArray height:(CGFloat)height complete:(pickerViewCompleteBlock)complete;

@property(nonatomic,copy)pickerViewCompleteBlock block;


@end
