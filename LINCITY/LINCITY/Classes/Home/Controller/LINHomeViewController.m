//
//  LINHomeViewController.m
//  LINCITY
//
//  Created by 林荣安 on 15/11/18.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINHomeViewController.h"
#import "LINRrecommenderHeadView.h"
#import "LINHomeSectionModel.h"
#import "LINRecommenderCell.h"
#import "LINShowViewController.h"

#define HOMECELL @"homeCell"
#define HOME_SEC_HEADER @"homeSectionHeader"

@interface LINHomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, weak) UITableView *tab;
@property(nonatomic, strong) NSArray *dataArray;


@end

@implementation LINHomeViewController


- (NSArray *)dataArray{
    if (!_dataArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeDatas.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            [LINHomeSectionModel mj_setupObjectClassInArray:^NSDictionary *{
                return @{@"body":[LINHomeCellModel class]};
            }];
            LINHomeSectionModel *sectionModel = [LINHomeSectionModel mj_objectWithKeyValues:dict];
            [temp addObject:sectionModel];
        }
        _dataArray = temp;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationTitleView];
    [self setupUI];
    [self.view setBackgroundColor:[UIColor redColor]];
//    self.automaticallyAdjustsScrollViewInsets = NO;

}


- (void)setupNavigationTitleView{
    UISegmentedControl *titleView  = [[UISegmentedControl alloc] initWithItems:@[@"推荐",@"附近"]];
    titleView.bounds = (CGRect){0,0,self.view.w * .5,30};
    self.navigationItem.titleView = titleView;
    self.navigationItem.titleView.tintColor = COLORWiTH(26, 163, 146);
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20 weight:2]};
    [titleView setTitleTextAttributes:dict forState:UIControlStateNormal];
    [titleView setTitleTextAttributes:dict forState:UIControlStateSelected];
    [titleView addTarget:self action:@selector(titleViewValueDidChange:) forControlEvents:UIControlEventValueChanged];
}


- (void)setupUI{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[LINRecommenderCell class] forCellReuseIdentifier:HOMECELL];
    [tableView registerClass:[LINRrecommenderHeadView class] forHeaderFooterViewReuseIdentifier:HOME_SEC_HEADER];
    [self.view addSubview:tableView];
    self.tab = tableView;
    tableView.sectionFooterHeight = 0;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 60;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}


- (void)titleViewValueDidChange:(UISegmentedControl *)sender{
    NSLog(@"testing baby-------> %@", @"titleViewValueDidChange");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray[section] body].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LINRecommenderCell *cell = [tableView dequeueReusableCellWithIdentifier:HOMECELL forIndexPath:indexPath];
    LINHomeCellModel *cellModel = [self.dataArray[indexPath.section] body][indexPath.row];
    cell.cellModel = cellModel;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    LINRrecommenderHeadView *headerV = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HOME_SEC_HEADER];
    headerV.sectionModel = self.dataArray[section];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerViewTapped:)];
    [headerV addGestureRecognizer:tap];
    return headerV;
}

#pragma --headerView的手势处理
- (void)headerViewTapped:(UIGestureRecognizer *)sender{

    LINShowViewController *v = [[LINShowViewController alloc] init];
    v.view.backgroundColor = [UIColor randColor];
    [self.navigationController pushViewController:v animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}



@end
