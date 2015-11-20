//
//  CarListCell.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CarListCell.h"

@implementation CarListCell
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    return _titleLb;
}

- (UILabel *)replyCountLb {
    if(_replyCountLb == nil) {
        _replyCountLb = [[UILabel alloc] init];
        _replyCountLb.font = [UIFont systemFontOfSize:12];
        _replyCountLb.textColor = [UIColor grayColor];
    }
    return _replyCountLb;
}

- (TRImageView *)iconIV0 {
    if(_iconIV0 == nil) {
        _iconIV0 = [[TRImageView alloc] init];
    }
    return _iconIV0;
}

- (TRImageView *)iconIV1 {
    if(_iconIV1 == nil) {
        _iconIV1 = [[TRImageView alloc] init];
    }
    return _iconIV1;
}

- (TRImageView *)iconIV2 {
    if(_iconIV2 == nil) {
        _iconIV2 = [[TRImageView alloc] init];
    }
    return _iconIV2;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.replyCountLb];
        [self.contentView addSubview:self.iconIV0];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
        /** 题目 左上10 , 右10 */
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(self.replyCountLb.mas_left).mas_equalTo(3);
        }];
        /** 跟帖数 上右10像素, */
        [self.replyCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        /** 图片 宽度相等 ,间距5,边缘10,高度88 */
        [self.iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake((kWindowW-40)/3, 88));
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(10);
        }];
        [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV0.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(_iconIV0);
        }];
        [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.topMargin.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV1.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return self;
}

@end
