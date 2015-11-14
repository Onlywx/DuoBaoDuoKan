//
//  BigImgCell.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BigImgCell.h"

@implementation BigImgCell
- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:15];
    }
    return _titleLb;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLb];
        /** 图片 左上右0， 横向居中*/
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(0);

            make.centerX.mas_equalTo(0);
        }];
        /** 题目 比图片下边缘矮3*/
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.rightMargin.mas_equalTo(_iconIV.mas_rightMargin);
            make.top.mas_equalTo(_iconIV.mas_bottom).mas_equalTo(3);
            make.bottom.mas_equalTo(-3);
            
        }];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
