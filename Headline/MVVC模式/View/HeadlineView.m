
//
//  HeadlineView.m
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "HeadlineView.h"
#import "HeadlineCell.h"
#import "HeadlineDetaVc.h"
@interface HeadlineView()<UITableViewDataSource,UITableViewDelegate>{

    HeadlineSelectedCellCallBack _headlineSelectedCellCallBack;

}
@property(nonatomic,weak)UITableView *tableView;

@end
static NSString *const headlineCellID = @"headlineCellID";
@implementation HeadlineView

#pragma mark - Setter && Getter Methods
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        //1.初始化tableView
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        
        tableView.backgroundColor =[UIColor clearColor];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HeadlineCell class]) bundle:nil] forCellReuseIdentifier:headlineCellID];
        tableView.rowHeight = 100;
        tableView.tableFooterView =[UIView new];
        tableView.dataSource = self;
        tableView.delegate = self;
        [self addSubview:tableView];

        //6.将TableView添加到self中
        _tableView = tableView;
        
        
    }
    return _tableView;
}

- (void)setDataArr:(NSArray *)dataArr{
    //获取主页控制器传过来的数据源
    _dataArr = dataArr;
    
    [self.tableView reloadData];//刷新TableView
}
- (void)setHeadlineSelectedCellCallBack:(HeadlineSelectedCellCallBack)headlineSelectedCellCallBack{
    
    _headlineSelectedCellCallBack = headlineSelectedCellCallBack;
    
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
    if (_headlineSelectedCellCallBack) {
        _headlineSelectedCellCallBack(model.newsTitle,model.newsLink);
    }
}


@end
