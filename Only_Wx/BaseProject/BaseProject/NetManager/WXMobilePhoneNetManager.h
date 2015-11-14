//
//  WXMobilePhoneNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

#import "WXMobilePhoneModel.h"
#define kMobilePhonePath [NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1348649654285/%ld-20.html",(long)index]
@interface WXMobilePhoneNetManager : BaseNetManager
+ (id)getMobilePhoneWithIndex:(NSInteger)index kCompletionHandle;
@end
     