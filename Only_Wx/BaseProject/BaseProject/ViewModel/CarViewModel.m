//
//  CarViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CarViewModel.h"

@implementation CarViewModel

//- (NSArray *)adsImgsrc {
//    if(_adsImgsrc == nil) {
//        _adsImgsrc = [NSArray new];
//        
//    }
//    return _adsImgsrc;
//}

- ( WXCarListModel *)modelForRow:(NSInteger)row
{
    return  self.dataArr[row];
}
/** ads数组*/
- (NSArray *)adsForRow:(NSInteger)row
{
    return [self modelForRow:row].ads;
}

/** imgextra数组*/
- (NSArray *)imgextraForRow:(NSInteger)row
{
    return [self modelForRow:row].imgextra;
}
/** auto_wap数组*/
- (NSArray *)autowapForRow:(NSInteger)row
{
    return [self modelForRow:row].auto_wap;
}

// 获取广告图
- (NSURL *)adsImgsrcForRow:(NSInteger)row
{
    WXCarListAdsModel *model = [self adsForRow:row][row];
    
    return [NSURL URLWithString:model.imgsrc];
}
/** 获取imgextra图*/
- (NSURL *)imgextraURLForRow:(NSInteger)row
{
    WXCarListImageXtraModel *model = [self imgextraForRow:row][row];
    return [NSURL URLWithString:model.imgsrc];
}
/** 获取auto_wap图*/
- (NSURL *)autowapURLForRow:(NSInteger)row
{
    WXCarListAutoWapModel *model = [self autowapForRow:row][row];
    return [NSURL URLWithString:model.imgsrc];
}



- (NSInteger)rowNumber
{
    return  self.dataArr.count;
}


- (NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
- (NSString *)replyCountForRow:(NSInteger)row
{
    return @([self modelForRow:row].replyCount).stringValue;
}
- (NSString *)digestForRow:(NSInteger)row
{
    return [self modelForRow:row].digest;
}
- (NSURL *)iconIVURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].imgsrc];
}
/** 获取列表中某行数据对应的下一页链接 */
- (NSURL *)detailURLForRowInList:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].url_3w];
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
