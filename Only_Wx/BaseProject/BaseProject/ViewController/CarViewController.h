//
//  CarViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarViewController : UIViewController
//内容页的首页应该是单例的，每次进程都只初始化一次
+ (UINavigationController *)standardCarNavi;

@end
