//
//  ManHuaViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ManHuaViewController.h"
#import "MobilePhoneListCell.h"
#import "ManHuaViewModel.h"
#import "Factory.h"
#import "ManHuaDetailViewController.h"
#import "BigImgCell.h"

@interface ManHuaViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)ManHuaViewModel *phoneVM;
@end

@implementation ManHuaViewController
+ (UINavigationController *)standardMHNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ManHuaViewController *vc = [[ManHuaViewController alloc]init];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;

}
- (ManHuaViewModel *)phoneVM {
    if(_phoneVM == nil) {
        _phoneVM = [[ManHuaViewModel alloc] init];
    }
    return _phoneVM;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        _tableView.backgroundColor = [UIColor greenSeaColor];
        
        
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.phoneVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
                
            }];
        }];
        
        [_tableView.header beginRefreshing];
        
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.phoneVM getMoreDataCompletionHandle:^(NSError *error) {
                
                if (error) {[self showErrorMsg:error.localizedDescription];
                }else{
                    [self.tableView reloadData];
                    
                    [_tableView.footer endRefreshing];
                }
            }];
        }];
        [_tableView registerClass:[MobilePhoneListCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[BigImgCell class] forCellReuseIdentifier:@"BigCell"];
        
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.phoneVM.rowNumber;
}
kRemoveCellSeparator
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        BigImgCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BigCell"];
        cell.titleLb.text = [self.phoneVM titleForRow:indexPath.row];
        [cell.iconIV.imageView setImageWithURL:[self.phoneVM iconIVURLForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@"angle-mask"]];
        return cell;

    }
    MobilePhoneListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.phoneVM titleForRow:indexPath.row];
    cell.digestLb.text = [self.phoneVM digestForRow:indexPath.row];
    cell.replyCountLb.text = [NSString stringWithFormat:@"%@跟帖",[self.phoneVM replyCountForRow:indexPath.row]];
    
    [cell.iconIV.imageView setImageWithURL:[self.phoneVM iconIVURLForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@"angle-mask"]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        return 200;
    }else{
    return 80;
}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ManHuaDetailViewController *vc=[[ManHuaDetailViewController alloc] initWithURL:[self.phoneVM detailURLForRowInList:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"漫画";
    [Factory addMenuItemToVC:self];
    self.tableView.hidden = NO;


}
@end
