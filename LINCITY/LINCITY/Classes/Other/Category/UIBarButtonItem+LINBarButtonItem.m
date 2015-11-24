//
//  UIBarButtonItem+LINBarButtonItem.m
//  LINCITY
//
//  Created by 林荣安 on 15/11/19.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "UIBarButtonItem+LINBarButtonItem.h"

@implementation UIBarButtonItem (LINBarButtonItem)

//默认大小 image
+ (UIBarButtonItem *)barButtonItemWithNormalImage:(NSString *)image target:(id)target action:(SEL)action{
    UIImage *normalImage = [UIImage imageNamed:image];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = (CGRect){0,0,20,20};
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)barButtonItemWithNormalImageBig:(NSString *)image target:(id)target action:(SEL)action{
    UIImage *normalImage = [UIImage imageNamed:image];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = (CGRect){0,0,35,35};
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

//自定义大小 image
+ (UIBarButtonItem *)barButtonItemWithNormalImage:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height{
    UIImage *normalImage = [UIImage imageNamed:image];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = (CGRect){0,0,width,height};
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

//默认大小 title
+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title textColor:(UIColor *)color target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.frame = (CGRect){0,0,40,40};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

//自定义大小 title
+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title textColor:(UIColor *)color target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.frame = (CGRect){0,0,width,height};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


@end
