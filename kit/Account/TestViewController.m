//
//  TestViewController.m
//  kit
//
//  Created by gcb999 on 16/6/11.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "TestViewController.h"

@implementation TestViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITableView *tableview=[UITableView TableViewWithFrame:self.view.bounds style:UITableViewStylePlain backgroundColor:rgb(234, 234, 234) delegate:self separatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.view addSubview:tableview];

    
    [self ShyNavBar:tableview];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil)
    {
        // Create a cell to display an ingredient.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:showUserInfoCellIdentifier];
        
    }
    
    // Configure the cell.
    cell.textLabel.text=@"签名";
    return cell;
}



@end
