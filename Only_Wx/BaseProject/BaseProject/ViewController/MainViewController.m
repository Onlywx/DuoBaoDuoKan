//
//  MainViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MainViewController.h"
#import "LeftViewController.h"
#import "MobilePhoneListCell.h"
#import "MobilePhoneViewModel.h"
#import "Factory.h"
#import "MainDetailViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)MobilePhoneViewModel *phoneVM;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation MainViewController
+ (UINavigationController *)standardPhoneNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MainViewController *vc = [[MainViewController alloc]init];                         navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}
- (MobilePhoneViewModel *)phoneVM {
    if(_phoneVM == nil) {
        _phoneVM = [[MobilePhoneViewModel alloc] init];
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
    MobilePhoneListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.phoneVM titleForRow:indexPath.row];
    cell.digestLb.text = [self.phoneVM digestForRow:indexPath.row];
    cell.replyCountLb.text = [NSString stringWithFormat:@"%@跟帖",[self.phoneVM replyCountForRow:indexPath.row]];
    
    [cell.iconIV.imageView setImageWithURL:[self.phoneVM iconIVURLForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@"angle-mask"]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
        MainDetailViewController *vc=[[MainDetailViewController alloc] initWithURL:[self.phoneVM detailURLForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
   

}
- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"手机";
    [Factory addMenuItemToVC:self];
    self.tableView.hidden = NO;
    
}



@end
