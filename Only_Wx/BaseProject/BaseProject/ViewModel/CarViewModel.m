//
//  CarViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CarViewModel.h"

@implementation CarViewModel

- (WXCarListModel *)modelForArr:(NSArray *)arr row:(NSInteger)row
{
    return arr[row];
}


/** ads数组*/
- (NSArray *)adsForRow:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].ads;
}
/** 是否存在Imagxtra数组*/
- (BOOL)containImgextra:(NSInteger)row
{
    if ([self modelForArr:self.dataArr row:row].imgextra == nil) {
        return NO;
    }
    return YES;
}
/** 通过行数 返回此行中对应的图片链接数组 */
- (NSArray *)imgextraForRow:(NSInteger)row
{
    NSArray *arr = [self modelForArr:self.dataArr row:row].imgextra;
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < arr.count; i ++) {
        WXCarListImageXtraModel *model = arr[i];
        [array addObject:model.imgsrc];
    }
    return [array copy];
}
/** auto_wap数组*/
- (NSArray *)autowapForRow:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].auto_wap;
}

/** 获取imgextra图*/
- (NSURL *)imgextraURLForRow:(NSInteger)row
{
   WXCarListImageXtraModel *model = [self imgextraForRow:row][0];
    
    return [NSURL URLWithString:model.imgsrc];
}



- (NSInteger)rowNumber
{
    return  self.dataArr.count;
}
- (NSString *)titleForRow:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].title;
}
- (NSString *)replyCountForRow:(NSInteger)row
{
    return @([self modelForArr:self.dataArr row:row].replyCount).stringValue;
}
- (NSString *)digestForRow:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].digest;
}
- (NSURL *)iconIVURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].imgsrc];
}



/** 获取列表中某行数据对应的下一页链接 */
- (NSURL *)detailURLForRowInList:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].url_3w];
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [CarNetManager getCarWithIndex:_index completionHandle:^( WXCarModel *model, NSError *error) {
        if (_index == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.list];
        
        completionHandle(error);
    }];
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _index = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _index += 20;
    [self getDataFromNetCompleteHandle:completionHandle];
}


@end
