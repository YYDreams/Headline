//
//  HeadlineView.h
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeadlineView;
//点击cell回调
typedef void(^HeadlineSelectedCellCallBack)(NSString *title,NSString *newsLink);

@interface HeadlineView : UIView
@property(nonatomic,strong)NSArray *dataArr;

- (void)setHeadlineSelectedCellCallBack:(HeadlineSelectedCellCallBack)headlineSelectedCellCallBack;
@end
