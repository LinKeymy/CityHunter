//
//  LINCondictionV.h
//  LINCITY
//
//  Created by 林荣安 on 15/11/24.
//  Copyright © 2015年 Family. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LINCondictionV;

typedef NS_ENUM(NSInteger,LINCondictionButtonType) {
    LINCondictionButtonTypeClassfy = 10,
    LINCondictionButtonTypeArea = 11,
    LINCondictionButtonTypeShort = 12,
    LINCondictionButtonTypeMap = 13,
    LINCondictionButtonTypeList = 14
};


@protocol LINCondictionVDelegate <NSObject>

@optional
//前三个按钮的通知事件
- (void)condictionView:(LINCondictionV *)view didBttionClickFrom:(LINCondictionButtonType *)fromType to:(LINCondictionButtonType *)toType;

//地图的通知事件
//选择是通知代理
-(void)conditionViewdidSelectedMap:(LINCondictionV *)view;

- (void)conditionViewdidSelectedList:(LINCondictionV *)view;
/** 取消选择按钮 */
- (void)conditionViewCancelSelectButton:(LINCondictionV *)view;


@end

@interface LINCondictionV : UIView

@property(nonatomic, weak) id<LINCondictionVDelegate> delegate;

@end
