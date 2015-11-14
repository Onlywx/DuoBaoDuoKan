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

@property (nonatomic,strong)NSMutableArray *adsImgsrc;


- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)replyCountForRow:(NSInteger)row;
- (NSString *)digestForRow:(NSInteger)row;
- (NSURL *)iconIVURLForRow:(NSInteger)row;
/** 获取列表中某行数据对应的下一页链接 */
- (NSURL *)detailURLForRowInList:(NSInteger)row;

/** 获取广告图*/
- (NSURL *)adsImgsrcForRow:(NSInteger)row;
/** 获取imgextra图*/
- (NSURL *)imgextraURLForRow:(NSInteger)row;
/** 获取auto_wap图*/
- (NSURL *)autowapURLForRow:(NSInteger)row;

/** ads数组*/
- (NSArray *)adsForRow:(NSInteger)row;
/** imgextra数组*/
- (NSArray *)imgextraForRow:(NSInteger)row;
/** auto_wap数组*/
- (NSArray *)autowapForRow:(NSInteger)row;
@end
