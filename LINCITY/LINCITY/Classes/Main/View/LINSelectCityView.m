//
//  LINSelectCityView.m
//  LINCITY
//
//  Created by 林荣安 on 15/11/20.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINSelectCityView.h"
#import "LINMenuButton.h"
#import "LINCityButton.h"
@interface LINSelectCityView ()

@property(nonatomic, weak) UIButton *firstBtn;
@property(nonatomic, weak) UIButton *secondBtn;
@property(nonatomic, weak) UIButton *thirdBtn;

//记录城市顺序数组
@property(nonatomic, strong) NSArray  *cityNames;


@end

@implementation LINSelectCityView


- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.alpha = 0;
        self.backgroundColor = [UIColor blackColor];
        [self setUp];
    }
    return self;
}



- (void)setUp{
    LINMenuButton *firstBtn = [LINMenuButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:firstBtn];
    self.firstBtn = firstBtn;
    
    LINMenuButton *secondBtn = [LINMenuButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:secondBtn];
    self.secondBtn = secondBtn;
    
    LINMenuButton *thirdBtn = [LINMenuButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:thirdBtn];
    self.thirdBtn = thirdBtn;
}

+ (instancetype)selectCityViewCityButton:(LINCityButton *)cityBtn{
    LINSelectCityView *selectView =  [[self alloc] initWithFrame:(CGRect){cityBtn.x,cityBtn.y,cityBtn.w,cityBtn.h * 4}];
    selectView.layer.cornerRadius = cityBtn.layer.cornerRadius;
    selectView.backgroundColor = cityBtn.backgroundColor;
    selectView.layer.masksToBounds = YES;
    //index 0 用于给外部的cityBtn显示，其它用于内部btn的title
    NSMutableArray *cities = [NSMutableArray arrayWithObjects:@"北京",@"上海",@"广州",@"深圳", nil];
    
    //get current cityname
    NSString *nowCity = [cityBtn titleForState:UIControlStateNormal];
    [cities enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:nowCity]) {
            [cities exchangeObjectAtIndex:idx withObjectAtIndex:0];
            *stop = YES;
        }
    }];
    NSLog(@"testing baby-------> %@", @"selectCityViewCityButton");
    selectView.cityNames = cities;
    return selectView;
}


//index 0 用于给外部的cityBtn显示，其它用于内部btn的title
-(void)setCityNames:(NSArray *)cityNames{

    _cityNames = cityNames;
    for (int i  = 1 ; i < cityNames.count ; i ++) {
        [self setButton:self.subviews[i-1] index:i];
        NSLog(@"testing baby-------> %@", self.subviews[i-1]);
    }
}


- (void)setButton:(LINMenuButton *)btn index:(int)index{
    
    CGFloat btnW = self.w;
    CGFloat btnH = self.h / self.cityNames.count;
    CGFloat btnX = 0;
    CGFloat btnFY = btnH;
    CGFloat margin = btnW * .15;
    
    //间隔线
    UIView *whiteLine = [[UIView alloc] initWithFrame:(CGRect){margin,index * btnFY,btnW - 2 * margin,1}];
    whiteLine.backgroundColor = [UIColor whiteColor];
    [self addSubview:whiteLine];
    
    btn.frame = (CGRect){btnX,btnFY * index,btnW,btnH};
    btn.alpha = .6;
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:self.cityNames[index] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(selectBtnClicked:) forControlEvents:UIControlEventTouchDown];
}



- (void)selectBtnClicked:(LINMenuButton *)sender{
    if (self.changeCityNameBlock) {
        self.changeCityNameBlock(sender);
    }
    [self removeFromSuperview];
}

@end




























