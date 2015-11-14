//
//  LeftViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import <NSString+Icons.h>
#import "MainViewController.h"
#import "ManHuaViewController.h"
#import "RankListViewController.h"
@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *itemNames;
@end

@implementation LeftViewController
- (NSArray *)itemNames{
    return @[@"手机", @"漫画", @"汽车", @"健康",@"音乐"];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor redColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView=[UIView new];
        [self.view addSubview:_tableView];
        _tableView.backgroundColor=[UIColor clearColor];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/3));
            make.centerY.mas_equalTo(50);
            
            make.left.mas_equalTo(10);
        }];
        //去掉分割线
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.accessoryType = 1;
    cell.textLabel.text = self.itemNames[indexPath.row];
    cell.backgroundColor=[UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}
kRemoveCellSeparator
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[MainViewController standardPhoneNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[ManHuaViewController standardMHNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];

            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            [self.sideMenuViewController setContentViewController:[RankListViewController defaultNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];

            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor greenSeaColor];
    
    UIImageView *imageViewbk = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"7132"]];
    [self.view addSubview:imageViewbk];
    [imageViewbk mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.tableView reloadData];
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(10, 40, 100, 100)];
    headView.layer.cornerRadius = 100/2;
    headView.clipsToBounds = YES;
    UIView *footView = [UIView new];
    
    [imageViewbk addSubview:footView];
    [footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-30);
        make.left.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(kWindowW/2+50, 50));
    }];
    UILabel *label = [UILabel new];
    [footView addSubview:label];
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor yellowColor];
    label.text = @"我的地盘我做主";
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.view addSubview:headView];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"touxiang3"]];
    
    imageView.layer.cornerRadius = 50;
    
    [headView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

@end
