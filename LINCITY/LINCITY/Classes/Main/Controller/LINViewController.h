//
//  LINViewController.h
//  LINCITY
//
//  Created by 林荣安 on 15/11/18.
//  Copyright © 2015年 Family. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CoverDidRomove)();

@interface LINViewController : UIViewController


@property(nonatomic, strong) UIButton *converBtn;
@property(nonatomic, strong)  CoverDidRomove coverDidRomove;

//记录缩放状态
@property(nonatomic, assign ,getter=isScale) BOOL scale;


- (void)coverClick;
//用于缩放
- (void)leftBarItemClicked;




@end
