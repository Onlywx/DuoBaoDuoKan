//
//  CarViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CarViewController.h"
#import "MobilePhoneListCell.h"
#import "CarViewModel.h"
#import "Factory.h"
#import "CarListCell.h"
@interface CarViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)CarViewModel *cVM;
@end

@implementation CarViewController
+ (UINavigationController *)standardCarNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CarViewController *vc = [[CarViewController alloc]init];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];

        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.backgroundColor = [UIColor greenSeaColor];
        
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.cVM refreshDataCompletionHandle:^(NSError *error) {
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
            [self.cVM getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    if (error) {[self showErrorMsg:error.localizedDescription];
                    }else{
                        [self.tableView reloadData];
                        
                        [_tableView.footer endRefreshing];
                    }
                }
            }];
        }];
    }
    [_tableView registerClass:[MobilePhoneListCell class] forCellReuseIdentifier:@"Cell"];
    [_tableView registerClass:[CarListCell class] forCellReuseIdentifier:@"BigCell"];
    return _tableView;
}

- (CarViewModel *)cVM {
    if(_cVM == nil) {
        _cVM = [[CarViewModel alloc] init];
    }
    return _cVM;
}
kRemoveCellSeparator
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.cVM containImgextra:indexPath.row]) {
        CarListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BigCell"];
        cell.titleLb.text = [self.cVM titleForRow:indexPath.row];
        cell.replyCountLb.text = [NSString stringWithFormat:@"%@跟帖",[self.cVM replyCountForRow:indexPath.row]];
        [cell.iconIV0.imageView setImageWithURL:[self.cVM iconIVURLForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@"angle-mask"]];
       // [cell.iconIV1.imageView setImage:[UIImage imageNamed:@"10979715_0800"]];
        [cell.iconIV1.imageView setImageWithURL:[self.cVM imgextraForRow:indexPath.row][0]
         placeholderImage:[UIImage imageNamed:@"angle-mask"]];
       // cell.iconIV1.imageView.backgroundColor = [UIColor redColor];
        //cell.iconIV2.imageView.backgroundColor = [UIColor grayColor];
        
        NSLog(@"%@",[self.cVM imgextraForRow:indexPath.row][0]);
        
        [cell.iconIV2.imageView setImageWithURL:[self.cVM imgextraForRow:indexPath.row][1]placeholderImage:[UIImage imageNamed:@"angle-mask"]];

   
        return cell;


    }
    
    
    MobilePhoneListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.cVM titleForRow:indexPath.row];
    cell.digestLb.text = [self.cVM digestForRow:indexPath.row];
    
    cell.replyCountLb.text = [NSString stringWithFormat:@"%@跟帖",[self.cVM replyCountForRow:indexPath.row]];
    
    [cell.iconIV.imageView setImageWithURL:[self.cVM iconIVURLForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@"angle-mask"]];
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [self.cVM containImgextra:indexPath.row]?135:90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    
//    ManHuaDetailViewController *vc=[[ManHuaDetailViewController alloc] initWithURL:[self.phoneVM detailURLForRowInList:indexPath.row]];
//    [self.navigationController pushViewController:vc animated:YES];
//    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"汽车";
    [Factory addMenuItemToVC:self];
    self.tableView.hidden = NO;
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
