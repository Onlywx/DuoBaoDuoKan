//
//  WXManHuaNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "WXManHuaModel.h"

#define kManHuaPath [NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1444270454635/%ld-20.html",(long)index]
@interface WXManHuaNetManager : BaseNetManager
+ (id)getManHuaWithIndex:(NSInteger)index kCompletionHandle;
@end
