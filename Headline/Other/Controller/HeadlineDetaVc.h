//
//  HeadlineDetaVc.h
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadlineDetaVc : UIViewController

@property (nonatomic,strong) NSString *navTitle;//导航栏标题
@property (nonatomic,strong) NSString *urlStr;//用webView加载详情
- (instancetype)initWithNavTitle:(NSString *)navTitle urlStr:(NSString *)urlStr;
@end
