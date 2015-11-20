//
//  CarNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CarNetManager.h"

@implementation CarNetManager
+ (id)getCarWithIndex:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle
{
    return  [self GET:kCarPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([WXCarModel objectWithKeyValues:responseObj],error);
    }];
}

@end
