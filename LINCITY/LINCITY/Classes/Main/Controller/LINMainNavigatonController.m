//
//  LINMainNavigatonController.m
//  LINCITY
//
//  Created by 林荣安 on 15/11/18.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINMainNavigatonController.h"

@interface LINMainNavigatonController ()

@end

@implementation LINMainNavigatonController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

//在收到第一个消息前在runtime中被调用，子类也会调用这个方法
+ (void)initialize{
    //设置导航栏样式
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [bar setBackgroundImage:[UIImage imageNamed:@"recomend_btn_gone"] forBarMetrics:UIBarMetricsDefault];
    //translucent 半透明 = no
    bar.translucent = NO;
    
    NSMutableDictionary  *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [bar setTitleTextAttributes:dict];
}



@end
