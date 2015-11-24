//
//  LINShowViewController.m
//  LINCITY
//
//  Created by 林荣安 on 15/11/18.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINShowViewController.h"
#import "LINCondictionV.h"

@interface LINShowViewController ()

@property(nonatomic, strong) NSMutableArray *datas;


@end

@implementation LINShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}



- (void)setupUI{
    LINCondictionV *conditonv = [[LINCondictionV alloc] init];
    [self.view addSubview:conditonv];
    
}

@end
