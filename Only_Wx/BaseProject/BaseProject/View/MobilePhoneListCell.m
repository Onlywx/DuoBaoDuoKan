//
//  MobilePhoneListCell.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MobilePhoneListCell.h"

@implementation MobilePhoneListCell
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

- (UILabel *)digestLb {
    if(_digestLb == nil) {
        _digestLb = [[UILabel alloc] init];
        _digestLb.font = [UIFont systemFontOfSize:13];
        _digestLb.textColor = [UIColor lightGrayColor];
        _digestLb.numberOfLines = 2;
    }
    return _digestLb;
}

- (UILabel *)replyCountLb {
    if(_replyCountLb == nil) {
        _replyCountLb = [[UILabel alloc] init];
        _replyCountLb.font = [UIFont systemFontOfSize:12];
        _replyCountLb.textColor = [UIColor grayColor];
    }
    return _replyCountLb;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.digestLb];
        [self.contentView addSubview:self.replyCountLb];
/** 图片 左10，宽高70，50 竖向居中*/
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(80, 60));
            make.centerY.mas_equalTo(0);
        }];
/** 题目 距离图片右边缘8,右边缘10,上边缘比图片上边缘矮3*/
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(_iconIV.mas_topMargin).mas_equalTo(3);
        }];
/** 摘要 左右边缘与题目一样，上边距离题目下标8像素*/
        [self.digestLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_titleLb.mas_leftMargin);
            make.rightMargin.mas_equalTo(_titleLb.mas_rightMargin);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(5);
        }];
/** 跟帖数 下边缘与图片对齐，右边与任意title对齐*/
        [self.replyCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_iconIV.mas_bottomMargin);
            make.rightMargin.mas_equalTo(_titleLb.mas_rightMargin);
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
