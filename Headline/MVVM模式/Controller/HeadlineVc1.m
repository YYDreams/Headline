//
//  HeadlineVc1.m
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "HeadlineVc1.h"
#import "HTTPRequest.h"
#import "HeadlineCell.h"
#import "HeadlineViewModel.h"
#import "HeadlineDetaVc.h"
@interface HeadlineVc1 ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic, weak) UITableView *tableView;
@end
static NSString *const headlineCellID = @"headlineCellID";
@implementation HeadlineVc1

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
   [self loadNetworkFormData];
}

#pragma mark - setupTableView
-(void)setupTableView{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStylePlain];
    
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HeadlineCell class]) bundle:nil] forCellReuseIdentifier:headlineCellID];
    tableView.rowHeight = 100;
    tableView.tableFooterView =[UIView new];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}
#pragma mark - loadData
-(void)loadNetworkFormData{
    
    HeadlineViewModel *viewModel =[[HeadlineViewModel alloc]init];
    __weak typeof(self) weakSelf = self;
    [viewModel handleDataWithSuccess:^(NSArray *arr) {
        [weakSelf.dataArr removeAllObjects];
        [weakSelf.dataArr addObjectsFromArray:arr];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    } failure:^(NSError *error) {
        HHLog(@"请求失败error%@",error.description);
    }];    
}
#pragma mark - <UITableViewDataSource,UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HeadlineCell *cell =[tableView dequeueReusableCellWithIdentifier:headlineCellID];
    cell.model = self.dataArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HeadlineModel *model=self.dataArr[indexPath.row];
    HeadlineDetaVc *detaVc=[[HeadlineDetaVc alloc]initWithNavTitle:model.newsTitle urlStr:model.newsLink];
    
    [self.navigationController pushViewController:detaVc animated:YES];
}
#pragma mark - Setter && Getter Methods
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
@end
