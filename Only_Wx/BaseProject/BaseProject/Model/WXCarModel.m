//
//  WXCarModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WXCarModel.h"

@implementation WXCarModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [WXCarListModel class]};
}
@end
@implementation WXCarListModel

+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [WXCarListAdsModel class], @"auto_wap" : [WXCarListAutoWapModel class],@"imgextra":[WXCarListImageXtraModel class]};
}
//@"imgextra":[WXCarListImageXtraModel class]
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"cTemplate":@"template"};
}

@end
@implementation WXCarListImageXtraModel



@end

@implementation WXCarListAdsModel

@end


@implementation WXCarListAutoWapModel

@end


