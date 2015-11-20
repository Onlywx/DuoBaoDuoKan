//
//  BigImgCell.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface BigImgCell : UITableViewCell
/** 大图片*/
@property (nonatomic,strong)TRImageView *iconIV;
/** 题目标签*/
@property (nonatomic,strong)UILabel *titleLb;

@end
