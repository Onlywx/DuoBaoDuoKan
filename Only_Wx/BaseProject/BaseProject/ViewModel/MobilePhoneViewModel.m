//
//  MobilePhoneViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MobilePhoneViewModel.h"

@implementation MobilePhoneViewModel
- (WXMobilePhonePhoneModel *)modelForRow:(NSInteger)row
{
    return  self.dataArr[row];
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
    self.dataTask = [WXMobilePhoneNetManager getMobilePhoneWithIndex:_index completionHandle:^(WXMobilePhoneModel *model, NSError *error) {
        if (_index == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.T1348649654285];
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
