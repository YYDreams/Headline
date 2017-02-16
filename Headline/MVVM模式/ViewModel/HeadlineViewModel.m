//
//  HeadlineViewModel.m
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "HeadlineViewModel.h"
#import "HTTPRequest.h"
#import "HeadlineModel.h"
@implementation HeadlineViewModel
- (void)handleDataWithSuccess:(void(^)(NSArray *arr))success failure:(void(^)(NSError *error))failure{

    NSMutableDictionary *param =[[NSMutableDictionary alloc]init];
    param[@"limit"] = @(20);
    param[@"skip"] = @(0);
    
    [HTTPRequest GET:@"http://cloud.bmob.cn/f8bb56aa119e68ee/news_list_2_0" parameter:param success:^(id resposeObject) {
        
        
        if ([resposeObject[@"status"]integerValue] == 1 ) {
            HHLog(@"%@",resposeObject);
            NSMutableArray *tempArr =[NSMutableArray array];
            for (NSDictionary *dic in resposeObject[@"data"][@"results"]) {
                HeadlineModel *model = [[HeadlineModel alloc]initWithDic:dic];
             
                [tempArr addObject:model];
            }
            success(tempArr);
        }
        
    } failure:^(NSError *error) {
        failure(error);
        HHLog(@"erroer:%@",error.localizedDescription);
    }];


}
@end
