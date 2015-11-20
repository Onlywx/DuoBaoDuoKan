
//
//  BiZhiViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BiZhiViewController.h"
#import "Factory.h"
#import "BiZhiDetailViewController.h"
@interface BiZhiViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray*biZhiArr;
@property (nonatomic,strong)NSMutableDictionary *cells;
@end

@implementation BiZhiCell
- (UIImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(_iconView.mas_width);
        }];
    }
    return _iconView;
}
@end



@implementation BiZhiViewController
- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        [self.view addSubview:_collectionView];
       // _collectionView.backgroundColor = [UIColor yellowColor];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[BiZhiCell class] forCellWithReuseIdentifier:@"Cell"];
    }
     _collectionView.backgroundColor = [UIColor whiteColor];    return _collectionView;
}

- (NSMutableArray *)biZhiArr
{
    if (!_biZhiArr) {

        _biZhiArr = [NSMutableArray arrayWithObjects:@"bizhi0",@"bizhi1",@"bizhi2",@"bizhi3",@"bizhi4",@"bizhi5",@"bizhi6",@"bizhi7",nil];
    }
    
    return _biZhiArr;
}


- (UINavigationController *)defaultNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        navi = [[UINavigationController alloc] initWithRootViewController:self];
    });
    return navi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cloudsColor];
    self.title = @"设置壁纸";
    [Factory addMenuItemToVC:self];
    self.collectionView.hidden = NO;
    _cells = [NSMutableDictionary dictionary];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.biZhiArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BiZhiCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    

    for (int i = 0; i < self.biZhiArr.count;i++) {
        if (indexPath.row == i) {
            cell.iconView.image = [UIImage imageNamed:self.biZhiArr[i]];
        }

    }
    cell.iconView.userInteractionEnabled = YES;
    
    self.cells[indexPath] = cell;
    
      return cell;
}

- (BiZhiDetailViewController *)bizhi {
    if (!_bizhi) {
        _bizhi = [[BiZhiDetailViewController alloc]init];
    }
    return _bizhi;
}

#pragma mark - UICollectionViewDataDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    for (int i = 0; i < self.biZhiArr.count;i++) {
        if (indexPath.row == i) {
            BiZhiCell *cell = self.cells[indexPath];
    self.bizhi.imageView.image = cell.iconView.image;
        }
    }
    [self.navigationController pushViewController:self.bizhi animated:YES];

}

#pragma mark - UICollectionViewDelegateFlowLayout
/** section的上下左右边距 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}
///** 最小行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 10;
}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 20;
//}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = kWindowW *0.2;
    CGFloat height = width;
    return CGSizeMake(width, height);
}




@end
