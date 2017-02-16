//
//  HeadlineModel.h
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeadlineModel : NSObject
@property(copy,nonatomic)NSString *newsImage; //图片
@property(copy,nonatomic)NSString *newsTitle; //title

@property(copy,nonatomic)NSString *updatedAt; //更新时间

@property(copy,nonatomic)NSString *newsType; //类型

@property(copy,nonatomic)NSString *newsLink; //url

@property(copy,nonatomic)NSString *newsSource; //来源

-(instancetype)initWithDic:(NSDictionary *)dic;
@end
