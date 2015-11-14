//
//  WXManHuaNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WXManHuaNetManager.h"

@implementation WXManHuaNetManager
+ (id)getManHuaWithIndex:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle
{
   return  [self GET:kManHuaPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
       completionHandle([WXManHuaModel objectWithKeyValues:responseObj],error);
    }];
}
@end
