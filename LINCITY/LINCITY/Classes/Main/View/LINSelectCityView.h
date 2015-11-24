//
//  LINSelectCityView.h
//  LINCITY
//
//  Created by 林荣安 on 15/11/20.
//  Copyright © 2015年 Family. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LINCityButton;
@class LINMenuButton;


typedef void(^ChangeCityNameBlock)(LINMenuButton *);

@interface LINSelectCityView : UIView

@property(nonatomic, copy) ChangeCityNameBlock changeCityNameBlock;
+ (instancetype)selectCityViewCityButton:(LINCityButton *)cityBtn;
- (void)showSelectViewToView:(UIView *)superView belowView:(UIView *)belowView;


@end
