//
//  CarNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
//
#import "WXCarModel.h"
#define kCarPath [NSString stringWithFormat:@"http://c.3g.163.com/nc/auto/list/5YyX5Lqs/%ld-20.html",(long)index]

@interface CarNetManager : BaseNetManager
+ (id)getCarWithIndex:(NSInteger)index kCompletionHandle;

@end
