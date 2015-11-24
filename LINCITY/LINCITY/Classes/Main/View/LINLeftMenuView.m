//
//  LINLeftMenuView.m
//  LINCITY
//
//  Created by 林荣安 on 15/11/18.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINLeftMenuView.h"
#import "LINCityButton.h"
#import "LINSelectCityView.h"
#import "LINMenuButton.h"

@interface LINLeftMenuView ()


@property(nonatomic, weak) UIButton *selectedBtn;
@property(nonatomic, weak) UIButton *setHomepageBtn;
@property(nonatomic, weak) LINSelectCityView *selectCityView;

@end


@implementation LINLeftMenuView


- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}


- (void)initUI{
    //=========== -- add subviews
    self.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"bgImage"].CGImage);
    LINCityButton *cityBtn = [[LINCityButton alloc] init];
    cityBtn.backgroundColor = [UIColor blackColor];
    cityBtn.layer.shadowColor = COLORWiTH(146, 146, 146).CGColor;
    cityBtn.layer.shadowOffset = (CGSize){5,20};
    cityBtn.layer.shadowOpacity = 0.6;
    [self addSubview:cityBtn];
    
    //cityBtn attribute setting
    cityBtn.layer.cornerRadius = 8;
    cityBtn.layer.masksToBounds = YES;
    [cityBtn setTitle:@"北京" forState:UIControlStateNormal];
    [cityBtn setTitleColor:LIN_GET_GLOBAL_GREEN forState:UIControlStateNormal];
    [cityBtn setImage:[UIImage imageNamed:@"city_down"] forState:UIControlStateNormal];
    [cityBtn setImage:[UIImage imageNamed:@"city_up"] forState:UIControlStateSelected];
    [cityBtn addTarget:self action:@selector(cityBtnClicked:) forControlEvents:UIControlEventTouchDown];
    
    //others Btu_attribut seting
    UIButton *homeBtn = [[UIButton alloc] init];
    [homeBtn setBackgroundImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
    [homeBtn setBackgroundImage:[UIImage imageNamed:@"homeSeletced"] forState:UIControlStateSelected];
   
    [self addSubview:homeBtn];
#warning ----
    self.setHomepageBtn = homeBtn;
    
    UIButton *foundBtn = [[UIButton alloc] init];
    [foundBtn setBackgroundImage:[UIImage imageNamed:@"found"] forState:UIControlStateNormal];
    [foundBtn setBackgroundImage:[UIImage imageNamed:@"foundSelected"] forState:UIControlStateSelected];
    [self addSubview:foundBtn];
    
    UIImageView *blackLin = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blackLine"]];
    [self addSubview:blackLin];
    
    UIButton *unloginBtn = [[UIButton alloc] init];
    [unloginBtn setBackgroundImage:[UIImage imageNamed:@"unLogin"] forState:UIControlStateNormal];
    [self addSubview:unloginBtn];
    
    UIButton *sinaBtn = [[UIButton alloc] init];
    [sinaBtn setBackgroundImage:[UIImage imageNamed:@"sina"] forState:UIControlStateNormal];
    [sinaBtn setBackgroundImage:[UIImage imageNamed:@"sinaH"] forState:UIControlStateHighlighted];
    [self addSubview:sinaBtn];
    
    UIButton *weixinBtn = [[UIButton alloc] init];
    [weixinBtn setBackgroundImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
    [weixinBtn setBackgroundImage:[UIImage imageNamed:@"weixinH"] forState:UIControlStateHighlighted];
    [self addSubview:weixinBtn];
    
    UIImageView *blackLin1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blackLine"]];
    [self addSubview:blackLin1];
    
    UIButton *messageBtn = [[UIButton alloc] init];
    [messageBtn setBackgroundImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [messageBtn setBackgroundImage:[UIImage imageNamed:@"messageSelected"] forState:UIControlStateSelected];
    [self addSubview:messageBtn];
    
    UIButton *settingBtn = [[UIButton alloc] init];
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"seting"] forState:UIControlStateNormal];
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"setingSelected"] forState:UIControlStateSelected];
    [self addSubview:settingBtn];

    //= = = = = = = = = =添加约束
    [cityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(30);
        make.width.equalTo(self).multipliedBy(255/375.0);
        make.height.equalTo(self).multipliedBy(60/667.0);
        make.left.equalTo(@[homeBtn.mas_left,foundBtn.mas_left,unloginBtn.mas_left,
                            sinaBtn.mas_left,weixinBtn.mas_left,messageBtn.mas_left,settingBtn.mas_left]);
    }];
    
    
    [homeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self).multipliedBy(70/667.0);
        make.height.equalTo(@[foundBtn.mas_height,messageBtn.mas_height,settingBtn.mas_height,
                              unloginBtn.mas_height,weixinBtn.mas_height,sinaBtn.mas_height]);
        make.width.equalTo(@[cityBtn.mas_width,foundBtn.mas_width,sinaBtn.mas_width,
                             weixinBtn.mas_width,messageBtn.mas_width,settingBtn.mas_width]);
    }];

    [blackLin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self).multipliedBy(20/677.0);
        make.left.right.equalTo(self);
    }];
    
    [unloginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(homeBtn.mas_width).offset(50);
    }];

    [blackLin1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(blackLin.mas_height);
    }];
    
    //- - - - - - - - - -垂直方向等距排列subviews
    [self distributeSpacingVerticallyWith:self.subviews];
    
    // -- - - - - - - - -添加tag
    homeBtn.tag = LINleftButtonTypeHome;
    foundBtn.tag = LINleftButtonTypeFound;
    unloginBtn.tag = LINleftButtonTypeIcon;
    sinaBtn.tag = LINleftButtonTypeSina;
    weixinBtn.tag = LINleftButtonTypeWeiXin;
    messageBtn.tag = LINleftButtonTypeMessage;
    settingBtn.tag = LINleftButtonTypeSetting;
    
    //- - - - - - -添加点击事件
    [self addTargetForButton:homeBtn];
    [self addTargetForButton:foundBtn];
    [self addTargetForButton:unloginBtn];
    [self addTargetForButton:sinaBtn];
    [self addTargetForButton:weixinBtn];
    [self addTargetForButton:messageBtn];
    [self addTargetForButton:settingBtn];
}

- (void)setDelegate:(id<LINLeftMenuViewDelegate>)delegate{
    _delegate = delegate;
    [self leftBtnClicked:self.setHomepageBtn];
}

- (void)addTargetForButton:(UIButton *)button{
 [button addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

//cityButton的点击
- (void)cityBtnClicked:(LINCityButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
      LINSelectCityView *selectview = [LINSelectCityView selectCityViewCityButton:sender];
        self.selectCityView = selectview;
        [self addSubview:selectview];
        [self bringSubviewToFront:sender];
        [UIView animateWithDuration:.3 animations:^{
            selectview.alpha = .75;
        }];
        selectview.changeCityNameBlock = ^(LINMenuButton *newCity){
            NSString *oldCityName = [sender titleForState:UIControlStateNormal];
            [sender setTitle:[newCity titleForState:UIControlStateNormal] forState:UIControlStateNormal];
            sender.selected = NO;
            [self leftBtnClicked:self.setHomepageBtn];
            [newCity setTitle:oldCityName forState:UIControlStateNormal];
        };
        
    }else{
        [self.selectCityView removeFromSuperview];
        [self sendSubviewToBack:sender];
    }
}

//左边按钮的点击
- (void)leftBtnClicked:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(leftMenuViewButtonClickFrom:to:)]) {
        [self.delegate leftMenuViewButtonClickFrom:(LINleftButtonType)self.selectedBtn.tag to:sender.tag];
    }
    //重新设置按钮状态
    if (sender.tag != LINleftButtonTypeIcon && sender.tag != LINleftButtonTypeSina && sender.tag != LINleftButtonTypeWeiXin) {
        self.selectedBtn.selected = NO;
        sender.selected = YES;
        self.selectedBtn = sender;
    }
    
}
@end
