//
//  LINCondictionV.m
//  LINCITY
//
//  Created by 林荣安 on 15/11/24.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINCondictionV.h"
#import "LINMenuButton.h"//去掉hightliht状态的button



@implementation LINCondictionV


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    UIView *bgWrapView = [[UIView alloc] init];
    [self addSubview:bgWrapView];
    [bgWrapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 30, 0, -30));
    }];
    bgWrapView.backgroundColor = [UIColor orangeColor];
    UIView *seperate_lin1 = [[UIView alloc] init];
    UIView *seperate_lin2 = [[UIView alloc] init];
    UIView *seperate_lin3 = [[UIView alloc] init];
    
    [bgWrapView addSubview:seperate_lin1];
    [bgWrapView addSubview:seperate_lin2];
    [bgWrapView addSubview:seperate_lin3];
    seperate_lin1.backgroundColor = seperate_lin2.backgroundColor = seperate_lin3.backgroundColor = [UIColor whiteColor];
    
    LINMenuButton *classifyBtn = [[LINMenuButton alloc] init];
    LINMenuButton *arenBtn = [[LINMenuButton alloc] init];
    LINMenuButton *sortBtn = [[LINMenuButton alloc] init];
    LINMenuButton *mapBtn = [[LINMenuButton alloc] init];

    [classifyBtn setTitle:@"分类" forState:UIControlStateNormal];
    [arenBtn setTitle:@"地区" forState:UIControlStateNormal];
    [sortBtn setTitle:@"排序" forState:UIControlStateNormal];
    [arenBtn setTitle:@"地图" forState:UIControlStateNormal];
    
    [bgWrapView addSubview:classifyBtn];
    [bgWrapView addSubview:arenBtn];
    [bgWrapView addSubview:sortBtn];
    [bgWrapView addSubview:mapBtn];
    
    [seperate_lin1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@1);
        make.height.equalTo(bgWrapView.mas_height).multipliedBy(.5);
        make.height.equalTo(@[seperate_lin2.mas_height,seperate_lin3.mas_height]);
    }];
    
    [classifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@[@60,arenBtn.mas_width,sortBtn.mas_width,mapBtn.mas_width]);
        make.height.equalTo(@[arenBtn.mas_height,sortBtn.mas_height,mapBtn.mas_height,bgWrapView.mas_height]);
    }];
    
    [bgWrapView distributeSpacingHorizontallyWith:bgWrapView.subviews];
}

@end

