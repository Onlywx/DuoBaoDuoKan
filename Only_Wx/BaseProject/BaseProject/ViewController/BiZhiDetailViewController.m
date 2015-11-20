
//
//  BiZhiDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BiZhiDetailViewController.h"
#import "LeftViewController.h"
@interface BiZhiDetailViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BiZhiDetailViewController

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenSeaColor];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"设置为壁纸" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 80, 30);
    [btn bk_addEventHandler:^(id sender) {
        [self.delegate biZhiController:self changeBiZhi:self.imageView.image];
        [self.navigationController popViewControllerAnimated:YES];
        
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    self.navigationItem.rightBarButtonItems = @[spaceItem,menuItem];
    
    self.imageView.userInteractionEnabled = YES;
    self.imageView.center = self.view.center;
    
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
        make.center.mas_equalTo(0);
    }];
    
#warning fix
    //添加自动布局后，imageView没有尺寸，需要layout之后才能生成尺寸
    [self.imageView setNeedsLayout];
    [self.imageView layoutIfNeeded];
    
    //设置图片显示到桌面并缩放
    [self loadImageView];
    
    //添加pan手势 位移
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc ]initWithTarget:self action:@selector(pan:)];
    [self.imageView addGestureRecognizer:panGR];
    //添加pinch手势 缩放
    UIPinchGestureRecognizer *pinchGR = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    pinchGR.delegate = self;
    [self.imageView addGestureRecognizer:pinchGR];
    //添加rotation手势 旋转
    UIRotationGestureRecognizer *rotationGR = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
    rotationGR.delegate = self;
    [self.imageView addGestureRecognizer:rotationGR];
    //添加tap手势 双击
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    tapGR.numberOfTapsRequired = 2;
    [self.imageView addGestureRecognizer:tapGR];
    

}
//位移
- (void)pan:(UIPanGestureRecognizer *)gr
{
    CGPoint translate = [gr translationInView:self.imageView];
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, translate.x, translate.y);
    [gr setTranslation:CGPointZero inView:self.imageView];
    
}
- (void)tap:(UITapGestureRecognizer *)gr
{
    [self loadImageView];
    
}
- (void)pinch:(UIPinchGestureRecognizer *)gr
{
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, gr.scale, gr.scale);
    gr.scale = 1;
}

- (void)rotation:(UIRotationGestureRecognizer *)gr
{
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, gr.rotation);
    gr.rotation = 0;
}

- (void)loadImageView
{
    //显示到中间
    self.imageView.center = self.view.center;

    //缩放看到全部
    CGFloat scaleX = self.view.bounds.size.width/self.imageView.bounds.size.width * 0.9;
    CGFloat scaleY = self.view.bounds.size.height/self.imageView.bounds.size.height * 0.9;
    CGFloat scale = MIN(scaleX, scaleY);
    self.imageView.transform = CGAffineTransformMakeScale(scale, scale);

    

}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
