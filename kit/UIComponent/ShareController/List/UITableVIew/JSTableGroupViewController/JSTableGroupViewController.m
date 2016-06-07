//
//  JSTableGroupViewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/6/3.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTableGroupViewController.h"

@interface JSTableGroupViewController ()
{
    BOOL is_CustormCell;//用户自定义Cell
}
@end


@implementation JSTableGroupViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}


#pragma mark -支持一个Cell
- (instancetype)initWithStyle:(UITableViewStyle)style state:(JSTableViewState)state tableViewCellClass:(Class) cellclass delegate:(id<JSTableViewControllerDelegate>)delegate{
    

    self.rowsOfSectionDic=[NSMutableDictionary dictionary];
    if (!cellclass) {
        is_CustormCell=YES;
    }
    
    return  [super initWithStyle:style state:state tableViewCellClass:cellclass delegate:delegate];
}

#pragma mark -自定义两个以上不同Cell

- (instancetype)nitWithStyle:(UITableViewStyle)style state:(JSTableViewState)state   delegate:(id<JSTableViewControllerDelegate>)delegate{
    
//    self.sections=[NSMutableArray array];
    self.rowsOfSectionDic=[NSMutableDictionary dictionary];
    is_CustormCell=YES;
    return  [super initWithStyle:style state:state tableViewCellClass:nil delegate:delegate];

}



#pragma mark ----------------------TableView 代理方法----------------------------------------


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.rowsOfSectionDic.count;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(JSTableViewController:numberOfRowsInSection:)]){
        return [self.delegate JSTableViewController:self numberOfRowsInSection:section];
    }
    
    NSString *str=self.rowsOfSectionDic.allKeys[section];
    NSArray * array = self.rowsOfSectionDic[str];
    return array.count;

    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (is_CustormCell) {//用户自定义Cell

        return (UITableViewCell *) [self.delegate JSTableViewController:self cellForRowAtIndexPath:indexPath];
       
        
    }
    else{//一个Cell

    
    
        self.JSTableViewCellDelegate=[tableView dequeueReusableCellWithIdentifier:KSWIdentifier forIndexPath:indexPath];
    
       NSString *str=self.rowsOfSectionDic.allKeys[indexPath.section];;
    
        NSArray *array= self.rowsOfSectionDic[str];
    
        id content=array[indexPath.row];
    
    [self.JSTableViewCellDelegate JSTableViewController:self  rowsOfSections:self.rowsOfSectionDic content:content indexPath:indexPath];
    
        return (UITableViewCell *)self.JSTableViewCellDelegate;
        
    }

}

#pragma mark ----------------------TableView 刷新方法----------------------------------------

-(void)reloadData{
        [self.tableView reloadData];
}

-(void)reloadHeader{
    
    [self.tableView reloadData];
    [self.tableView.header endRefreshing];
    
}


-(void)reloadFooter{
    
    [self.tableView reloadData];
    [self.tableView.footer endRefreshing];
    
}



@end
