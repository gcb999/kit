//
//  JSPickerViewController.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSPickerViewController.h"


@interface JSPickerViewController ()
{
    CGFloat _height;
    NSInteger selectIndex;
}

@property(nonatomic,strong)NSArray *dataArray;
@end

@implementation JSPickerViewController

- (instancetype)initWithData:(NSArray *)dataArray height:(CGFloat)height complete:(pickerViewCompleteBlock)complete{
    self = [super init];
    if (self) {
        
        _height=height;
        self.dataArray=dataArray;
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
    
    //PickView

    UIPickerView* pkView = [[UIPickerView alloc] initWithFrame:rect];
    pkView.backgroundColor=[UIColor whiteColor];
    pkView.delegate = self;
    pkView.dataSource = self;
    [pkView setShowsSelectionIndicator:YES];
    [self.view addSubview:pkView];

    
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.dataArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    selectIndex = row;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
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
    self.block(self,self.dataArray[selectIndex]);
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

@end
