//
//  LINMainViewController.m
//  LINCITY
//
//  Created by 林荣安 on 15/11/18.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINMainViewController.h"
#import "LINSettingViewController.h"
#import "LINMessageViewController.h"
#import "LINFoundViewController.h"
#import "LINBeenViewController.h"
#import "LINCollectionViewController.h"
#import "LINUserViewController.h"
#import "LINHomeViewController.h"
#import "LINMainNavigatonController.h"
#import "LINLeftMenuView.h"

@interface LINMainViewController ()<UIGestureRecognizerDelegate,LINLeftMenuViewDelegate>


@property(nonatomic, weak) LINViewController *showViewController;
@property(nonatomic, weak) LINLeftMenuView *leftMemuView;

@end

@implementation LINMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"bgImage"].CGImage);
    //添加子控制器
    NSArray *classNames = @[@"LINHomeViewController", @"LINFoundViewController", @"LINUserViewController", @"LINCollectionViewController", @"LINBeenViewController", @"LINMessageViewController", @"LINSettingViewController"];
    for (NSString *className in classNames) {
        UIViewController *vc = [[NSClassFromString(className) alloc] init
                                ];
        vc.navigationItem.title = className;
        LINMainNavigatonController *navC = [[LINMainNavigatonController alloc] initWithRootViewController:vc];
        [self addChildViewController:navC];
    }
    
    LINLeftMenuView *left = [[LINLeftMenuView alloc] init];
    [self.view insertSubview:left atIndex:1];
    self.leftMemuView = left;
    left.delegate = self;
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view).offset(40);
        make.bottom.equalTo(self.view).offset(-30);
        make.right.equalTo(self.view).offset(-60);
    }];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    


}


#pragma mark Pan--- 拖拽控制右边的view的transform
- (void)pan:(UIPanGestureRecognizer *)panSender{
//手势移动的偏移量
    CGFloat moveX = [panSender translationInView:self.view].x;
    //＝ ＝ ＝ ＝ ＝ ＝ ＝ ＝ ＝  ＝当前没有缩放的情况 ＝ ＝ ＝ ＝ ＝ ＝ ＝ ＝ ＝
    if (self.showViewController.isScale == NO) {
        if (moveX <= max_MoveX + 5 && moveX >=0) {
            CGFloat scaleXY = 1 - moveX / max_MoveX * (2 * Scale_TopMargin / iScreen_Height);
            //先scale后translate
            CGAffineTransform transform = CGAffineTransformMakeScale(scaleXY, scaleXY);
            self.showViewController.navigationController.view.transform = CGAffineTransformTranslate(transform, moveX/scaleXY - iScreen_Width * (1 - scaleXY)/2, 0);
        }

        if (panSender.state == UIGestureRecognizerStateEnded)
        {
            //如果超过一半
            if (moveX >= max_MoveX / 2.0) {
                CGFloat duration =  max_MoveX - moveX > 0 ? ((max_MoveX - moveX) / max_MoveX) * .5 : -((max_MoveX - moveX) / max_MoveX) * .5;
                [UIView animateWithDuration:duration animations:^{
                    CGAffineTransform transform = CGAffineTransformMakeScale(zoomScale_Factor, zoomScale_Factor);
                    self.showViewController.navigationController.view.transform = CGAffineTransformTranslate(transform, max_MoveX, 0);
                } completion:^(BOOL finished) {
                    self.showViewController.scale = YES;
//                    //手动点击按钮添加遮盖(left设置按钮)
                    [self.showViewController leftBarItemClicked];
                }];
            }else {//没有到一半
                [UIView animateWithDuration:.2 animations:^{
                    self.showViewController.navigationController.view.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {
                    self.showViewController.scale = NO;
                }];
            }
        }
          //＝ ＝ ＝ ＝ ＝ ＝ ＝ ＝ ＝  ＝当前已经缩放的情况 ＝ ＝ ＝ ＝ ＝ ＝ ＝ ＝ ＝
    }else if (self.showViewController.isScale == YES){
        
        CGFloat scaleXY = 1 - (moveX + max_MoveX) / max_MoveX * (2 * Scale_TopMargin / iScreen_Height);
        CGAffineTransform transform = CGAffineTransformMakeScale(scaleXY, scaleXY);
        self.showViewController.navigationController.view.transform = CGAffineTransformTranslate(transform, (moveX + max_MoveX) - iScreen_Width *(1-scaleXY)/2, 0);
    
        if (panSender.state == UIGestureRecognizerStateEnded) {
            if ((moveX + max_MoveX) <= max_MoveX / 2) {//小于一半的情况
                CGFloat duration = (max_MoveX + moveX) > 0 ? .5 * (max_MoveX + moveX) / max_MoveX : - .5 * (max_MoveX + moveX) / max_MoveX;
                [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    self.showViewController.navigationController.view.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {
                    self.showViewController.scale = NO;
//                    //手动点击按钮移除之前添加的遮盖
                    [self.showViewController coverClick];
                }];
            }else{//大于一半
            [UIView animateWithDuration:.2 animations:^{
                
                CGAffineTransform transform = CGAffineTransformMakeScale(zoomScale_Factor, zoomScale_Factor);
                self.showViewController.navigationController.view.transform = CGAffineTransformTranslate(transform, max_MoveX, 0);
            } completion:^(BOOL finished) {
                self.showViewController.scale = YES;
            }];
            }
        }
    }
}


- (void)leftMenuViewButtonClickFrom:(LINleftButtonType)FromIndex to:(LINleftButtonType)toIndex{
    //第三方登录
    if (toIndex == LINleftButtonTypeWeiXin || toIndex == LINleftButtonTypeSina) {
        return;
    }
    
    //没有登录的情况
    LINMainNavigatonController *newNavC = self.childViewControllers[toIndex];
    if (toIndex == LINleftButtonTypeIcon) {
        //如果点击的是登录，保持不变
        newNavC = self.childViewControllers[FromIndex];
        
    }
    
    LINMainNavigatonController *oldNavC = self.childViewControllers[FromIndex];
    [oldNavC.view removeFromSuperview];
    
    [self.view addSubview:newNavC.view];
    newNavC.view.transform = oldNavC.view.transform;
    //记录当前导航控制器的根控制器
    self.showViewController = newNavC.childViewControllers[0];
    
    [self.showViewController coverClick];

}

@end
