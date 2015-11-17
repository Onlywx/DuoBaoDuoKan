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



/** ads数组*/
- (NSArray *)adsForRow:(NSInteger)row;
/** 通过行数 返回此行中对应的图片链接数组 */
- (NSArray *)imgextraForRow:(NSInteger)row;
/** auto_wap数组*/
- (NSArray *)autowapForRow:(NSInteger)row;


/** 是否存在imgextra*/
- (BOOL)containImgextra:(NSInteger)row;






@end
