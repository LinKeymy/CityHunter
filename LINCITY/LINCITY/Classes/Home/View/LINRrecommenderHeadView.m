//
//  LINRrecommenderHeadView.m
//  LINCITY
//
//  Created by 林荣安 on 15/11/21.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINRrecommenderHeadView.h"
#import "LINHomeSectionModel.h"


@interface LINRrecommenderHeadView ()

@property(nonatomic, weak) UILabel *titleLabel;
@property(nonatomic, weak) UILabel *subTitleLabel;

@end

@implementation LINRrecommenderHeadView

- (void)setSectionModel:(LINHomeSectionModel *)sectionModel{
    _sectionModel = sectionModel;
    _titleLabel.text = sectionModel.tag_name;
    _subTitleLabel.text = sectionModel.section_count;
    UIColor *colorll = [UIColor colorWithHexString:sectionModel.color alpha:1];
    self.contentView.backgroundColor = colorll;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    [self setupSubViews];
    return self;
}

//注册的话这方法不会被调用，而是回自动调用上面的方法
- (instancetype)initWithFrame:(CGRect)frame{
    LINLog(@"%@",@"initWithFrame");
    self = [super initWithFrame:frame];
    return self;
}

- (void)setupSubViews{
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    titleLabel.font = [UIFont systemFontOfSize:20 weight:2];
    UILabel *subTitleLabel = [[UILabel alloc] init];
    [self addSubview:subTitleLabel];
    subTitleLabel.font = [UIFont systemFontOfSize:13];
    self.subTitleLabel = subTitleLabel;
    
    UIImageView *rightArrow = [[UIImageView alloc] init];
    rightArrow.image = [UIImage imageNamed:@"taoge"];
    [self addSubview:rightArrow];
    
    CGFloat margin = 10;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.top.equalTo(self).offset(margin);
        make.bottom.equalTo(self).offset(-margin);
    }];
    
    [rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.top.equalTo(self).offset(margin);
        make.bottom.equalTo(self).offset(-margin);
    }];
    
    [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(rightArrow.mas_left);
        make.centerY.equalTo(self);
    }];
}
@end
