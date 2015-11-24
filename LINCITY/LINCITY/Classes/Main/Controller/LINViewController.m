//
//  LINViewController.m
//  LINCITY
//
//  Created by 林荣安 on 15/11/18.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINViewController.h"

#define Scale_AnimationWithDuration 0.3

@interface LINViewController ()

@end

@implementation LINViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    self.navigationItem.rightBarButtonItem  = [UIBarButtonItem barButtonItemWithNormalImage:@"search_icon_white_6P@2x" target:self action:@selector(rightBarItemCliked)];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithNormalImage:@"artcleList_btn_info_6P" target:self action:@selector(leftBarItemClicked)];
    self.view.backgroundColor = COLORWiTH(239, 239, 244);
    
}


//推出search 控制器
#warning -- not having finished
- (void)rightBarItemCliked{
    
    

}

- (void)leftBarItemClicked{
    //因为在scale后点击右边的view的任何位置都应该回到缩放的效果，而不是执行view是其它控件的功能响应，故仔最顶层添加一个button来拦截用户的其它操作。并用于响应使view——tranform会初始状态
    _converBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _converBtn.frame = self.navigationController.view.bounds;
    [_converBtn addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:_converBtn];
    
    [UIView animateWithDuration:Scale_AnimationWithDuration animations:^{
        CGAffineTransform transform = CGAffineTransformMakeScale(zoomScale_Factor, zoomScale_Factor);
        self.navigationController.view.transform = CGAffineTransformTranslate(transform,max_MoveX, 0);
        self.scale = YES;
    }];
}



- (void)coverClick{
    
    [UIView animateWithDuration:Scale_AnimationWithDuration animations:^{
        self.navigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.converBtn removeFromSuperview];
        //因为属性是强引用，故主动让它指向nil
        self.converBtn = nil;
        self.scale = NO;
        if (_coverDidRomove) {
            _coverDidRomove();
        }
    }];
    
}


@end
