//
//  CarViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "CarNetManager.h"
@interface CarViewModel : BaseViewModel
@property (nonatomic,assign)NSInteger rowNumber;
@property (nonatomic,assign)NSInteger index;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)replyCountForRow:(NSInteger)row;
- (NSString *)digestForRow:(NSInteger)row;
- (NSURL *)iconIVURLForRow:(NSInteger)row;

/** 获取列表中某行数据对应的下一页链接 */
- (NSURL *)detailURLForRowInList:(NSInteger)row;


- (NSInteger)adsNumber:(NSInteger)row;

/** 通过行数 返回此行中对应的ads数组中的图片*/
- (NSArray *)adsImgsrcForRow:(NSInteger)row;
/** 通过行数 返回此行中对应的ads数组中的题目*/
- (NSArray *)adsTitleForRow:(NSInteger)row;

/** 通过行数 返回此行中对应的图片链接数组 */
- (NSArray *)imgextraForRow:(NSInteger)row;
/** 通过行数 返回此行中对应的auto_wap数组*/
- (NSArray *)autowapForRow:(NSInteger)row;

/** 是否存在imgextra*/
- (BOOL)containImgextra:(NSInteger)row;
/** 是否存在ads*/
- (BOOL)containAds:(NSInteger)row;
/** 是否存在auto_wap*/
- (BOOL)containAuto_wqp:(NSInteger)row;
















@end
