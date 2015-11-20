//
//  WXMobilePhoneNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WXMobilePhoneNetManager.h"

@implementation WXMobilePhoneNetManager
+ (id)getMobilePhoneWithIndex:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kMobilePhonePath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([WXMobilePhoneModel objectWithKeyValues:responseObj],error);
    }];
}
@end
