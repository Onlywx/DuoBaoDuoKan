//
//  CarListCell.h
//  BaseProject
//  三张图的cell
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TRImageView.h"
@interface CarListCell : UITableViewCell
/** 题目标签*/
@property (nonatomic,strong)UILabel *titleLb;
/** 图片1*/
@property (nonatomic,strong)TRImageView *iconIV0;
/** 图片2*/
@property (nonatomic,strong)TRImageView *iconIV1;
/** 图片3*/
@property (nonatomic,strong)TRImageView *iconIV2;
/** 跟帖数标签*/
@property (nonatomic,strong)UILabel *replyCountLb;

@end
