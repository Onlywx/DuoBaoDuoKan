//
//  MobilePhoneListCell.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface MobilePhoneListCell : UITableViewCell
/** 左侧图片*/
 @property (nonatomic,strong)TRImageView *iconIV;
/** 题目标签*/
@property (nonatomic,strong)UILabel *titleLb;
/** 摘要标签*/
@property (nonatomic,strong)UILabel *digestLb;
/** 跟帖数标签*/
@property (nonatomic,strong)UILabel *replyCountLb;


@end
