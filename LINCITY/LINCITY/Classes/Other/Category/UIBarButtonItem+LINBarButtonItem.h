//
//  UIBarButtonItem+LINBarButtonItem.h
//  LINCITY
//
//  Created by 林荣安 on 15/11/19.
//  Copyright © 2015年 Family. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LINBarButtonItem)

//默认大小
+ (UIBarButtonItem *)barButtonItemWithNormalImage:(NSString *)image target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithNormalImageBig:(NSString *)image target:(id)target action:(SEL)action;

//只定义大小
+ (UIBarButtonItem *)barButtonItemWithNormalImage:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title textColor:(UIColor *)color target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height;


@end
