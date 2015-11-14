//
//  WXManHuaModel.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WXManHuaModel.h"

@implementation WXManHuaModel


+ (NSDictionary *)objectClassInArray{
    return @{@"T1444270454635" : [WXManManHuanModel class]};
}
@end
@implementation WXManManHuanModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"cTemplate":@"template"};
}
@end


