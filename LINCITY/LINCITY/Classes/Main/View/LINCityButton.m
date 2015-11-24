//
//  LINCityButton.m
//  LINCITY
//
//  Created by 林荣安 on 15/11/20.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINCityButton.h"

@implementation LINCityButton

- (void)setHighlighted:(BOOL)highlighted{
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentMode = UIViewContentModeCenter;
    self.titleLabel.x = self.w / 2 - 20;
    self.imageView.x = self.w / 2 + 20;
}


@end
