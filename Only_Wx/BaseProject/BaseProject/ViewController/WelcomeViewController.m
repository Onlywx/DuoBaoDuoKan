//
//  WelcomeViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WelcomeViewController.h"
#import "MainViewController.h"
#import "AppDelegate.h"
//3D切换
#import "iCarousel.h"
@interface WelcomeViewController ()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)iCarousel *ic;
//扁平化风格的按钮
@property (nonatomic,strong)FUIButton *btn;
//小圆点
@property (nonatomic,strong)UIPageControl *pageControl;
//存储图片名字
@property (nonatomic,strong)NSArray *imageNames;
@end

@implementation WelcomeViewController
- (iCarousel *)ic
{
    if (!_ic) {
        _ic = [iCarousel new];
//设置代理
        _ic.delegate = self;
        _ic.dataSource = self;
//修改切换模式
        _ic.type = 3;
//自动展示
        _ic.autoscroll = 0;
//改为翻页模式
        _ic.pagingEnabled = YES;
//滚动速度
        _ic.scrollSpeed = 5;
    }
    return _ic;
}
- (FUIButton *)btn{
    if (!_btn) {
        _btn = [FUIButton buttonWithType:0];
        _btn.buttonColor = [UIColor turquoiseColor];
        _btn.shadowColor = [UIColor greenSeaColor];
        _btn.shadowHeight = 3.0;
        _btn.cornerRadius = 6.0;
        _btn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_btn setTitleColor:[UIColor cloudsColor] forState:0];
        [_btn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [_btn setTitle:@"点击，享受生活" forState:0];
        [_btn bk_addEventHandler:^(id sender) {
            
            UINavigationController *vc = [MainViewController standardPhoneNavi];
            
          //MainViewController *vc = [MainViewController new];
            [self presentViewController:vc animated:YES completion:^{
                [UIApplication sharedApplication].keyWindow.rootViewController = vc;
            }];

            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
- (NSArray *)imageNames
{
    if (!_imageNames) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Welcome" ofType:@"bundle"];        NSFileManager *fileManager = [NSFileManager defaultManager];
        _imageNames = [fileManager subpathsAtPath:path];
    }
    return _imageNames;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    //配置 小圆点的 位置
    UIPageControl *pageControl =[[UIPageControl alloc]init];
    pageControl.frame =CGRectMake(0,self.view.frame.size.height -60,self.view.frame.size.width, 40);
    pageControl.numberOfPages =self. imageNames.count;
    pageControl.currentPageIndicatorTintColor =[UIColor whiteColor];
    pageControl.pageIndicatorTintColor =[UIColor grayColor];
    //不能与用户 交互
    pageControl.userInteractionEnabled = NO;
    self.pageControl =pageControl;
    [self.view addSubview:pageControl];
}

////小圆点随图片 移动 而 移动
- (void)carouselDidScroll:(iCarousel *)carousel;
{
    CGFloat offSet = carousel.scrollOffset;
    self.pageControl.currentPage = offSet;
}
#pragma mark - iCarousel
//添加循环滚动
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return NO;//不循环滚动
    }
//修改缝隙
    if (option == iCarouselOptionSpacing) {
        return value*1.5;
    }
    return value;
}
//有多少个cell
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.imageNames.count;
}
//每个cell什么样
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 100;
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Welcome" ofType:@"bundle"];
    path = [path stringByAppendingPathComponent:self.imageNames[index]];
    imageView.image = [UIImage imageWithContentsOfFile:path];
    imageView.userInteractionEnabled = YES;
    if (index == self.imageNames.count-1) {
        [imageView addSubview:self.btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-200);
            make.size.mas_equalTo(CGSizeMake(140, 30));
            make.centerX.mas_equalTo(0);
        }];

        //建立闪光区域，所有在闪光区域内的控件都会闪
        FBShimmeringView *sv = [FBShimmeringView new];
        
        [imageView addSubview:sv];
        [sv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-200);
            make.size.mas_equalTo(CGSizeMake(140, 30));
            make.centerX.mas_equalTo(0);
        }];
        //把label放入闪光区域
        sv.contentView = self.btn;
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //开始闪
        sv.shimmering = YES;
    }
    return view;
}

//两个cell之间的距离
- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return kWindowW-10;
}

@end
