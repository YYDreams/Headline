//
//  HeadlineVc2.m
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "HeadlineVc2.h"
#import "HTTPRequest.h"
#import "HeadlineModel.h"
#import "HeadlineView.h"
#import "HeadlineDetaVc.h"
@interface HeadlineVc2 ()
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)HeadlineView *headlineView;
@end
@implementation HeadlineVc2

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNetworkFormData];
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
        self.headlineView.dataArr = self.dataArr;
    } failure:^(NSError *error) {
        HHLog(@"erroer:%@",error.localizedDescription);
    }];
}

#pragma mark - Lazy Methods
-(HeadlineView *)headlineView{
    if (!_headlineView) {
        HeadlineView *headlineView = [[HeadlineView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height-49)];
        [headlineView setHeadlineSelectedCellCallBack:^(NSString *title, NSString *newsLink) {
            HeadlineDetaVc *detaVc =[[HeadlineDetaVc alloc]initWithNavTitle:title urlStr:newsLink];
            [self.navigationController pushViewController:detaVc animated:YES];
        }];
           
        [self.view addSubview:headlineView];
        _headlineView = headlineView;
    }
    return _headlineView;
}
-(NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
@end
