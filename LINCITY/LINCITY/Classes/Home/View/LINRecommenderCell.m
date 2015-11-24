//
//  LINRecommenderCell.m
//  LINCITY
//
//  Created by 林荣安 on 15/11/21.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINRecommenderCell.h"
#import "LINHomeCellModel.h"
#import "UIImageView+WebCache.h"


@interface LINRecommenderCell ()

@property(nonatomic, weak) UIImageView *bgImaeV;
@property(nonatomic, weak) UILabel *nameLabel;
@property(nonatomic, weak) UILabel *addressLabel;
@property(nonatomic, weak) UILabel *praiseLabel;
@property(nonatomic, weak) UIImageView *favImagev;
@property(nonatomic, weak) UIImageView *addressV;

@end

@implementation LINRecommenderCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self customSubViews];
    return self;
}

- (void)setCellModel:(LINHomeCellModel *)cellModel{
    _cellModel = cellModel;
    _nameLabel.text = cellModel.section_title;
    _addressLabel.text = cellModel.poi_name;
    _praiseLabel.text = cellModel.fav_count;
    [_addressV setImage:[UIImage imageNamed:@"index_address_icon"]];
    [_bgImaeV sd_setImageWithURL:[NSURL URLWithString:cellModel.imageURL] placeholderImage:[UIImage imageNamed:@"ContentViewNoImages"]];

}
- (void)customSubViews{
    
    UIImageView *bgImageV = [[UIImageView alloc] init];
    [self.contentView addSubview:bgImageV];
    self.bgImaeV = bgImageV;
    
    UIImageView *addressImageV = [[UIImageView alloc] init];
    [self.contentView addSubview:addressImageV];
    self.addressV = addressImageV;
    
    UIImageView *favImagev = [[UIImageView alloc] init];
    [favImagev setImage:[UIImage imageNamed:@"discoverList_collectionClicked"]];
    [self.contentView addSubview:favImagev];
    self.favImagev = favImagev;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:22 weight:2];
    [nameLabel setTextColor:[UIColor orangeColor]];
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *addressLabel = [[UILabel alloc] init];
    addressLabel.font = [UIFont systemFontOfSize:14 weight:1];
     [addressLabel setTextColor:[UIColor whiteColor]];
    [self.contentView addSubview:addressLabel];
    self.addressLabel = addressLabel;
    
    UILabel *praiseLabel = [[UILabel alloc] init];
    praiseLabel.font = [UIFont systemFontOfSize:14];
     [praiseLabel setTextColor:[UIColor orangeColor]];
    [self.contentView addSubview:praiseLabel];
    self.praiseLabel = praiseLabel;
    
    //layout
    CGFloat padding = 10;
    [bgImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [addressImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).offset(-padding);
        make.left.equalTo(self.contentView).offset(padding);
    }];
    
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addressImageV.mas_right).offset(padding);
        make.centerY.equalTo(addressImageV.mas_centerY);
    }];
    
    [praiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-padding);
        make.centerY.equalTo(addressImageV.mas_centerY);
    }];
    
    [favImagev mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(praiseLabel.mas_left).offset(-padding);
        make.centerY.equalTo(addressImageV.mas_centerY);
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addressImageV.mas_left);
        make.bottom.equalTo(addressImageV.mas_top).offset(-padding);
    }];
}



@end
