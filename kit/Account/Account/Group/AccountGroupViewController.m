//
//  AccountGroupViewController.m
//  UIComponent
//
//  Created by gcb999 on 16/6/6.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "AccountGroupViewController.h"
#import "HomeDetailViewController.h"


@interface AccountGroupViewController ()<JSTableViewControllerDelegate>
{
}
@property(nonatomic,strong)JSTableGroupViewController *tableGroupViewController;
@property(nonatomic,strong)JSPresentBaseTransition *transition;
@property(nonatomic,strong)JSPresentTransformScaleTransition *scaleTransition;
@end


@implementation AccountGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.fd_prefersNavigationBarHidden = YES;
    
    [self.view addSubview:self.tableGroupViewController.view];
    [self addChildViewController:self.tableGroupViewController];
    
    UIImageView *avater = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
    avater.image = [UIImage imageNamed:@"avater"];
    avater.center = CGPointMake(IPHONScreenWidth*0.5f, 100);
    
    
    [self.tableGroupViewController stretchHeaderImgUrl:@"photo.jpg" subViews:avater];
    

    
    
    
}

#pragma mark - JSTableViewController Delegate

//1：加载数据源
-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
   NSDictionary<NSString *,NSArray<JSSimpleTableViewCellModel*> *>   *accountModels= [JSSimpleTableViewCellModelGroupHelper shareInstance].groupTableViewModels;
    [self.tableGroupViewController.sections addObjectsFromArray: accountModels.allKeys];
    self.tableGroupViewController.rowsOfSectionDic= [JSSimpleTableViewCellModelGroupHelper shareInstance].groupTableViewModels;
    [self.tableGroupViewController reloadHeader];

    
  }


//2：点击事件
-(void)JSTableViewController:(JSTableViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *text= self.tableGroupViewController.sections[indexPath.section];
    if ([text isEqualToString:@"DatePickerView"]) {
        if (indexPath.row==0) {
            JSPickerViewController *ctrl=[[JSPickerViewController alloc] initWithData:@[@"1",@"2"] height:300 complete:^(JSPickerViewController *ctrl, NSString *text) {
                
                NSLog(@"---text=%@",text);
            }];
            
            
            self.transition=[[JSPresentBaseTransition alloc] initWithPresented:^(UIViewController *presented, UIViewController *presenting, UIViewController *source, HYBBaseTransition *transition) {
                
            } dismissed:^(UIViewController *dismissed, HYBBaseTransition *transition) {
                self.transition.transitionMode = kHYBTransitionDismiss;
            }];
            
            //     vc.modalPresentationStyle = UIModalPresentationCustom;
            ctrl.transitioningDelegate = self.transition;
            
            [self presentViewController:ctrl animated:YES completion:^{
                
            }];

        }
        else if (indexPath.row==1){
            
            JSDatePickerViewController *ctrl=[[JSDatePickerViewController alloc] initWitHeight:300 complete:^(JSDatePickerViewController *datePickerCtrl, NSString *text) {
                
                
                NSLog(@"---text=%@",text);
            }];
            
            
            self.transition=[[JSPresentBaseTransition alloc] initWithPresented:^(UIViewController *presented, UIViewController *presenting, UIViewController *source, HYBBaseTransition *transition) {
                
            } dismissed:^(UIViewController *dismissed, HYBBaseTransition *transition) {
                self.transition.transitionMode = kHYBTransitionDismiss;
            }];
            
            //     vc.modalPresentationStyle = UIModalPresentationCustom;
            ctrl.transitioningDelegate = self.transition;
            
            [self presentViewController:ctrl animated:YES completion:^{
                
            }];

        }
    }
    else if ([text isEqualToString:@"UITabbar"]){
        if (indexPath.row==0) {
            [[JSTabBarControllerConfig shareInstance] showBadgeWithStyle:WBadgeStyleNumber badge:1000 tabbarIndex:1 animationType:WBadgeAnimTypeNone];
        }
        else if (indexPath.row==1){
                  [[JSTabBarControllerConfig shareInstance] showBadgeWithStyle:WBadgeStyleNumber badge:1000 tabbarIndex:1 animationType:WBadgeAnimTypeNone];
        }
        else if (indexPath.row==2){
                [[JSTabBarControllerConfig shareInstance] hiddenBageWithTabbarIndex:1];
        }
        
    }

    JSSimpleTableViewCellModel *model=self.tableGroupViewController.rowsOfSectionDic[text][indexPath.row];
    UIViewController *ctrl=(UIViewController *)[[NSClassFromString(model.ctrl) alloc] init];
    if (ctrl) {
        [self.navigationController pushViewController:ctrl animated:YES];
    }
}




-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl heightForHeaderInSection:(NSInteger)section{
 
        return 22;

}




-(UIView *)JSTableViewController:(JSTableViewController *)JSCtrl viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 20)];
    view.backgroundColor= [UIColor whiteColor];
    UILabel *lablel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, IPHONScreenWidth , 20)];
    lablel.textColor = RGB(51, 51, 51);
    lablel.font=[UIFont systemFontOfSize:12];
    lablel.backgroundColor = RGB(242, 242, 242);
    lablel.text = [NSString stringWithFormat:@"   %@",self.tableGroupViewController.sections[section]];
    [view addSubview:lablel];
    return view;
  
}


#pragma mark -getter

-(JSTableGroupViewController *)tableGroupViewController{
    if (_tableGroupViewController==nil) {
        _tableGroupViewController=[[JSTableGroupViewController alloc] initWithStyle:UITableViewStyleGrouped state:JSTableViewNormal tableViewCellClass:[JSSimpleTableViewCell class] delegate:self];
        _tableGroupViewController.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableGroupViewController.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    }
    return _tableGroupViewController;
}


@end
