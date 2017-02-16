//
//  HeadlineVc.m
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "HeadlineVc.h"
#import "HTTPRequest.h"
#import "HeadlineCell.h"
#import "HeadlineModel.h"
#import "HeadlineDetaVc.h"

@interface HeadlineVc ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic, weak) UITableView *tableView;

@end
static NSString *const headlineCellID = @"headlineCellID";

@implementation HeadlineVc

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self loadNetworkFormData];
}

#pragma mark - setupTableView
-(void)setupTableView{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStylePlain];
    
    tableView.backgroundColor =[UIColor clearColor];
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

    NSMutableDictionary *param =[[NSMutableDictionary alloc]init];
    param[@"limit"] = @(20);
    param[@"skip"] = @(0);

    [HTTPRequest GET:@"http://cloud.bmob.cn/f8bb56aa119e68ee/news_list_2_0" parameter:param success:^(id resposeObject) {
        
        for (NSDictionary *dic in resposeObject[@"data"][@"results"]) {
            HeadlineModel *model = [[HeadlineModel alloc]initWithDic:dic];
            [self.dataArr addObject:model];
        }
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        HHLog(@"erroer:%@",error.localizedDescription);
    }];

}
#pragma mark - <UITableViewDataSource>
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
