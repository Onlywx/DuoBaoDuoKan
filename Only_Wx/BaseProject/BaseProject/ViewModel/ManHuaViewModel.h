//
//  ManHuaViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "WXManHuaNetManager.h"
@interface ManHuaViewModel : BaseViewModel
@property (nonatomic,assign)NSInteger rowNumber;

@property (nonatomic,assign)NSInteger index;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)replyCountForRow:(NSInteger)row;
- (NSString *)digestForRow:(NSInteger)row;
- (NSURL *)iconIVURLForRow:(NSInteger)row;
/** 获取列表中某行数据对应的下一页链接 */
- (NSURL *)detailURLForRowInList:(NSInteger)row;

@end
