//
//  JSPresentCommonViewCtrl.m
//  JiangSuTax
//
//  Created by Jobs on 13-6-3.
//  Copyright (c) 2013年 apple user. All rights reserved.
//

#import "JSPresentCommonViewCtrl.h"

@interface JSPresentCommonViewCtrl ()

@end

@implementation JSPresentCommonViewCtrl

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = rgb(240, 240, 240);
         selectIndex = 0;
    }
    return self;
}



#pragma mark -时间
-(void)datePickWithSelectBlock:(SelectBlock)selectBlock{
    
    self.selectBlock=selectBlock;
    [self setupPKView:1];
}

#pragma mark -pickView

-(void)pickerViewWithDataArr:(NSArray *)dataArr selectBlock:(SelectBlock)selectBlock{
    self.selectBlock=selectBlock;
    pkDataArray = [[NSMutableArray alloc] initWithArray:dataArr];
    [self setupPKView:0];
    
}





#pragma mark -- UIPickerView 
-(void)setupPKView:(NSUInteger)type{
    
    viewType=type;
    CGRect preRec,tpRec;
    CGRectDivide(self.view.bounds, &preRec, &tpRec, 44, CGRectMinYEdge);
    switch (type) {
        case 0:
        {
            CGRectDivide(tpRec, &preRec, &tpRec, 256, CGRectMinYEdge);
            pkView = [[UIPickerView alloc] initWithFrame:preRec];
            pkView.backgroundColor=[UIColor whiteColor];
            pkView.delegate = self;
            pkView.dataSource = self;
            [pkView setShowsSelectionIndicator:YES];
            [self.view addSubview:pkView];
             pkView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        }
            break;
        case 1:
        {
            CGRectDivide(tpRec, &preRec, &tpRec, 240, CGRectMinYEdge);
            datePkView = [[UIDatePicker alloc] initWithFrame:preRec];
            datePkView.datePickerMode = UIDatePickerModeDate;
            datePkView.maximumDate = [NSDate date];
            [self.view addSubview:datePkView];
            datePkView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        }
            break;
        default:
            break;
    }
    
}




-(void)cancelAction:(id)sender{
    
        self.selectBlock(self,@"");
    
}

-(void)doneAction:(id)sender{
    switch (viewType) {
        case 0:
        {
            if (pkDataArray.count > 0) {
                NSString *selStr = [pkDataArray objectAtIndex:selectIndex];
                self.selectBlock(self,selStr);
                
            }else{
                [self cancelAction:nil];
            }
        }
            break;
        case 1:
        {
            NSDateFormatter *df = [[NSDateFormatter alloc] init];
            [df setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
            [df setDateFormat:@"yyyy-MM-dd"];
            NSString *dateStr = [df stringFromDate:datePkView.date];
            self.selectBlock(self,dateStr);

        }
            break;
        default:
            break;
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect preRec,tpRec,hRec;
    CGRectDivide(self.view.bounds, &preRec, &tpRec, 44, CGRectMinYEdge);
    UIImageView *tpBarImgView = [UIImageView ImageViewImageName:nil frame:preRec];
    tpBarImgView.image = [UIImage ImageWithColor:rgb(34, 34, 34) frame:preRec];
    [self.view addSubview:tpBarImgView];
    
    hRec = UIEdgeInsetsInsetRect(preRec, UIEdgeInsetsMake(6, 10, 6, preRec.size.width-70));
    UIButton *btn = [UIButton ButtonWithSystemImage:hRec title:@"Cancel" titleColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15] target:self action:@selector(cancelAction:)];

    btn.titleLabel.adjustsFontSizeToFitWidth=YES;
    [self.view addSubview:btn];

    
    
    hRec = UIEdgeInsetsInsetRect(preRec, UIEdgeInsetsMake(6, preRec.size.width-60, 6, 10));
    btn = [UIButton ButtonWithSystemImage:hRec title:@"OK" titleColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15] target:self action:@selector(doneAction:)];
    [self.view addSubview:btn];

 
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return pkDataArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pkDataArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    selectIndex = row;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
