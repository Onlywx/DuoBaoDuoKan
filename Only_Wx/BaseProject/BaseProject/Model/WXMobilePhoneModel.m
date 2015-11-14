//
//  WXMobilePhoneModel.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WXMobilePhoneModel.h"

@implementation WXMobilePhoneModel


+ (NSDictionary *)objectClassInArray{
    return @{@"T1348649654285" : [WXMobilePhonePhoneModel class]};
}
@end
@implementation WXMobilePhonePhoneModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"cTemplate":@"template"};
}
@end


