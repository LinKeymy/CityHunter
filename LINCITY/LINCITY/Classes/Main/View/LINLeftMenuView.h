//
//  LINLeftMenuView.h
//  LINCITY
//
//  Created by 林荣安 on 15/11/18.
//  Copyright © 2015年 Family. All rights reserved.
//

#import <UIKit/UIKit.h>


//定义leftView的按钮类型，用于选择跳转
typedef NS_ENUM(NSInteger, LINleftButtonType) {
    LINleftButtonTypeHome = 0,
    LINleftButtonTypeFound,
    LINleftButtonTypeIcon,
    LINleftButtonTypeSina,
    LINleftButtonTypeWeiXin,
    LINleftButtonTypeMessage,
    LINleftButtonTypeSetting
};

#pragma --制定协议
@protocol  LINLeftMenuViewDelegate <NSObject>

@optional

//左边按钮被点击时调用
- (void)leftMenuViewButtonClickFrom:(LINleftButtonType)FromIndex to:(LINleftButtonType)toIndex;

@end

@interface LINLeftMenuView : UIView

#pragma -- 设置属性
@property(nonatomic, weak) id<LINLeftMenuViewDelegate> delegate;

- (void)coverIsRemove;

@end
