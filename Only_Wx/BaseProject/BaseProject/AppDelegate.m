//completionHandle:(void(^)(id model, NSError *error))completionHandle
//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "LeftViewController.h"
#import "WXMobilePhoneModel.h"
#import "WXMobilePhoneNetManager.h"
#import "MainViewController.h"
#import "WelcomeViewController.h"
#import "CarNetManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initializeWithApplication:application];

//    [WXMobilePhoneNetManager getMobilePhoneWithIndex:0 completionHandle:^(id model, NSError *error) {
//        DDLogVerbose(@"....");
//    }];
//    [CarNetManager getCarWithIndex:0 completionHandle:^(id model, NSError *error) {
//        DDLogVerbose(@"...");
//    }];
    
    NSDictionary *infoDic = [[NSBundle mainBundle]infoDictionary];
    NSString *key = @"CFBundleShortVersionString";
    NSString *currentVersion = infoDic[key];
    NSString *runVersion=[[NSUserDefaults standardUserDefaults] stringForKey:key];
    if (runVersion==nil || ![runVersion isEqualToString:currentVersion] ) {
        //没运行过 或者 版本号不一致，则显示欢迎页
        NSLog(@"显示欢迎页,window根视图设置为欢迎控制器对象");
        WelcomeViewController *vc = [WelcomeViewController new];
        self.window.rootViewController = vc;
        //保存新的版本号,防止下次运行再显示欢迎页
        [[NSUserDefaults standardUserDefaults] setValue:currentVersion forKey:key];
    }else{
        NSLog(@"显示主页面,window根视图设置为主页面控制器对象");
            self.window.rootViewController = self.sideMenu;
    }

//    self.window.rootViewController = self.sideMenu;
        [self configGlobalUIStyle]; //配置全局UI样式
    return YES;
}
/** 配置全局UI的样式 */
- (void)configGlobalUIStyle{
    /** 导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
    /** 设置导航栏背景图 */
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
    /** 配置导航栏题目的样式 */
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:kNaviTitleFontSize], NSForegroundColorAttributeName: kNaviTitleColor}];
}


/** 代码重构:用代码把功能实现以后，考虑代码结构如何编写可以更加方便后期维护 */
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (RESideMenu *)sideMenu{
    if (!_sideMenu) {
        _sideMenu=[[RESideMenu alloc]initWithContentViewController:[MainViewController standardPhoneNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //为sideMenu设置背景图,图片插件KSImageName，到Github下载
        //_sideMenu.backgroundImage =[UIImage imageNamed:@"10979715_0800"];
        //可以让出现菜单时不显示状态栏
        _sideMenu.menuPrefersStatusBarHidden = YES;
        //不允许菜单栏到了边缘还可以继续缩小
        _sideMenu.bouncesHorizontally = NO;
    }
    return _sideMenu;
}

@end
