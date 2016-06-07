//
//  JSMJNIndexTableViewController.m
//  kit
//
//  Created by gcb999 on 16/6/7.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSMJNIndexTableViewController.h"
#import "CountryCell.h"
#import "HotCountryCell.h"


@interface JSMJNIndexTableViewController ()<JSTableViewControllerDelegate,MJNIndexViewDataSource>
{
    
}
@property(nonatomic,strong)NSArray *section;

@end

@implementation JSMJNIndexTableViewController

#pragma mark -getter
-(JSTableGroupViewController *)tableGroupViewController{
    if (_tableGroupViewController==nil) {
        _tableGroupViewController=[[JSTableGroupViewController alloc] initWithStyle:UITableViewStylePlain state:JSTableViewPullHeader tableViewCellClass:nil delegate:self];
        _tableGroupViewController.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableGroupViewController.view.frame=self.view.bounds;
    }
    return _tableGroupViewController;
}


- (MJNIndexView *)indexView
{
    if (_indexView == nil) {
        _indexView = [[MJNIndexView alloc]initWithFrame:CGRectMake(0, 40, IPHONScreenWidth, IPHONScreenHeight - 200)];
        _indexView.dataSource = self;
       _indexView.getSelectedItemsAfterPanGestureIsFinished = YES;
       _indexView.font = [UIFont fontWithName:@"HelveticaNeue" size:13.0];
       _indexView.selectedItemFont = [UIFont fontWithName:@"HelveticaNeue" size:40.0];
       _indexView.backgroundColor = [UIColor clearColor];
       _indexView.curtainColor = nil;
       _indexView.curtainFade = 0.0;
       _indexView.curtainStays = NO;
       _indexView.curtainMoves = YES;
       _indexView.curtainMargins = NO;
       _indexView.ergonomicHeight = NO;
       _indexView.upperMargin = 22.0;
       _indexView.lowerMargin = 22.0;
       _indexView.rightMargin = 10.0;
       _indexView.itemsAligment = NSTextAlignmentCenter;
       _indexView.maxItemDeflection = 100.0;
       _indexView.rangeOfDeflection = 5;
       _indexView.fontColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];
       _indexView.selectedItemFontColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
       _indexView.darkening = NO;
       _indexView.fading = YES;
    }
    return _indexView;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    //1：添加列表
    [self.view addSubview:self.tableGroupViewController.view];
    [self addChildViewController:self.tableGroupViewController];
    
    //2:第三方索引
    [self.view addSubview:self.indexView];
    
    
}

#pragma mark MJMIndexForTableView datasource methods
- (NSArray *)sectionIndexTitlesForMJNIndexView:(MJNIndexView *)indexView
{
    return  self.tableGroupViewController.sections;
}
- (void)sectionForSectionMJNIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    
    [self.tableGroupViewController.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:index] atScrollPosition: UITableViewScrollPositionTop animated:YES];
}

#pragma mark -刷新reload MJIndex
- (void)reloadMJTableViewIndex
{
    [self.tableGroupViewController reloadHeader];
    [self.tableGroupViewController.tableView reloadSectionIndexTitles];
    [self.indexView refreshIndexItems];
    [self.tableGroupViewController.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}



#pragma mark - JSTableViewController delegate


#pragma mark - 自定义方法
- (void)getData
{
    //读取plist文件
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"address" ofType:@"plist"];
    NSDictionary * dataDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSDictionary * bigDic = dataDic[@"data"];
    NSArray * keyArray = [bigDic allKeys];
    NSMutableArray * dataArray = [NSMutableArray array];
  
    for (int i = 0; i < keyArray.count; i ++) {
        NSDictionary * dic = bigDic[keyArray[i]];//1:条数据
        CountryModel * model = [[CountryModel alloc]initWithDictionary:dic];
        [dataArray addObject:model];
    }
    
    
    
    
    //得到索引数组
    NSMutableArray * indexArray = [NSMutableArray array];
    NSArray *arrayPy=[NSArray arrayFor26LetterUpperGroups];
    [indexArray addObject:@"hot"];
    for (int i = 0; i < arrayPy.count; i ++) {
        for (CountryModel *model in dataArray) {

            NSString *py=arrayPy[i];
            NSString * indexLetter = [model.countryName substringWithRange:NSMakeRange(0, 1)];
            if ([py isEqualToString:indexLetter]) {
                [indexArray addObject:indexLetter];
                break;
            }
        }
    }
    self.tableGroupViewController.sections=indexArray;

    
    //热门国家数据
    NSDictionary * hotDic = dataDic[@"hot"];
    NSArray * hotKeys = [hotDic allKeys];
    NSMutableArray * hotArray = [NSMutableArray array];
    for (int i = 0; i < hotKeys.count; i ++) {
        NSString * str = hotDic[hotKeys[i]];
        [hotArray addObject:str];
    }
    
    
    
    //按字母整理好数
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < indexArray.count; i ++) {
        NSMutableArray * groupArray = [NSMutableArray array];
        for (CountryModel *model in dataArray) {
            NSString *py=arrayPy[i];
            NSString * indexLetter = [model.countryName substringWithRange:NSMakeRange(0, 1)];
            if ([py isEqualToString:indexLetter]) {
                [groupArray addObject:model];
            }
        }
        [dic setObject:groupArray forKey:indexArray[i]];
    }
    
   [dic setObject:hotArray forKey:@"hot"];
    [self.tableGroupViewController.rowsOfSectionDic addEntriesFromDictionary:dic];
    
   
}



-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    //1:加载数据源
    [self getData];
    
    
    
    //2:刷新索引
    [self reloadMJTableViewIndex];
    
    
}

-(NSInteger)JSTableViewController:(JSTableViewController *)JSCtrl numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 1;
    }
    else{
        NSArray * array = self.tableGroupViewController.rowsOfSectionDic[self.tableGroupViewController.sections[section]];
        return array.count;
    }
    
}




-(UITableViewCell *)JSTableViewController:(JSTableViewController *)JSCtrl cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
        static NSString * ID = @"hotCountry";
        HotCountryCell * cell = [JSCtrl.tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[HotCountryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.hotArray = JSCtrl.rowsOfSectionDic[@"hot"];
        return cell;
        
    }
    else{
        static NSString * ID = @"hotCountry1";
        id<JSTableViewCellDelegate> cell = [JSCtrl.tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[CountryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        NSString *str= JSCtrl.sections[indexPath.section];
        id content=JSCtrl.rowsOfSectionDic[str][indexPath.row];
        [cell JSTableViewController:JSCtrl sections:JSCtrl.sections rowsOfSections:JSCtrl.rowsOfSectionDic content:content indexPath:indexPath];
        return (UITableViewCell *)cell;
        
    }
    
}


//对section样式和内容修改
-(UIView*)JSTableViewController:(JSTableViewController *)JSCtrl viewForHeaderInSection:(NSInteger)section{
//    if (section == 0) {
//        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 80)];
//        return view;
//    }else
//    {
        //定义view设置样式，定义view中的title(lable)设置样式
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 20)];
        view.backgroundColor= [UIColor whiteColor];
        UILabel *lablel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, IPHONScreenWidth - 24, 20)];
        lablel.textColor = RGB(51, 51, 51);
        lablel.font=[UIFont systemFontOfSize:12];
        lablel.backgroundColor = RGB(242, 242, 242);
        lablel.text = [NSString stringWithFormat:@"   %@",self.tableGroupViewController.sections[section]];
        [view addSubview:lablel];
        return view;
//    }
}


//返回行间距
-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100.0f;
    }else
    {
        return 48.0f;
    }
}

-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0;
    }else{
        return 20.0f;
    }
}


@end
