//
//  HeadlineCell.h
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadlineModel.h"
@interface HeadlineCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iamgeView;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *SourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *TypeLabel;

@property (strong, nonatomic) HeadlineModel *model;
@end
