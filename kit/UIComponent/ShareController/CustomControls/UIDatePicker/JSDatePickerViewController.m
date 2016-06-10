//
//  JSDatePickerViewController.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSDatePickerViewController.h"

@interface JSDatePickerViewController ()
{
    CGFloat _height;
 
}
@end

@implementation JSDatePickerViewController

@synthesize   datePkView;

- (instancetype)initWitHeight:(CGFloat)height complete:(datePickerCompleteBlock)complete{
    self = [super init];
    if (self) {
        
        _height=height;

        self.block=complete;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.4];
    
    
    CGRect hrect,rect=self.view.bounds;
    CGFloat height=rect.size.height-_height;
    CGRectDivide(rect, &hrect, &rect, height, CGRectMinYEdge);
    
    CGRect preRec;
    
    CGRectDivide(rect, &preRec, &rect, 44, CGRectMinYEdge);
    
    //背景图片
    UIImageView *tpBarImgView = [UIImageView ImageViewImageName:nil frame:preRec];
    tpBarImgView.image = [UIImage ImageWithColor:rgb(34, 34, 34) frame:preRec];
    [self.view addSubview:tpBarImgView];
    
    //cancel
    CGRect hRec = UIEdgeInsetsInsetRect(preRec, UIEdgeInsetsMake(6, 10, 6, preRec.size.width-70));
    UIButton *btn = [UIButton ButtonWithSystemImage:hRec title:@"Cancel" titleColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15] target:self action:@selector(cancelAction)];
    
    btn.titleLabel.adjustsFontSizeToFitWidth=YES;
    [self.view addSubview:btn];
    
    
    //OK
    hRec = UIEdgeInsetsInsetRect(preRec, UIEdgeInsetsMake(6, preRec.size.width-60, 6, 10));
    btn = [UIButton ButtonWithSystemImage:hRec title:@"OK" titleColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15] target:self action:@selector(doneAction)];
    [self.view addSubview:btn];
    
    //DatePickview
    
  
    datePkView = [[UIDatePicker alloc] initWithFrame:rect];
     datePkView.backgroundColor = [UIColor whiteColor];
    datePkView.datePickerMode = UIDatePickerModeDate;
//    datePkView.maximumDate = [NSDate date];
    [self setBG:datePkView];
    [self.view addSubview:datePkView];

    
   

    
    
}

-(void)setBG:(UIDatePicker *)datePicker{
    
    //0-大背景的UIview;0-0各个小格子的UIview；0-1控件选中框上方那条横线；0-2控件选中框下方那条横线
    UIView *pickerView = [[datePkView subviews] objectAtIndex:0];//获取控件的子视图
    //将自己定义UIView 加在 控件的子视图上
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 30)];
    colorView.backgroundColor = [UIColor blueColor];
    colorView.alpha = 0.2f;
    colorView.center = pickerView.center;
    [pickerView addSubview:colorView];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)cancelAction{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)doneAction{
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [df setDateFormat:@"yyyy-MM-dd"];
     NSString *dateStr = [df stringFromDate:datePkView.date];

    self.block(self,dateStr);
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


@end
