//
//  HeadlineCell.m
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "HeadlineCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation HeadlineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(HeadlineModel *)model{

    _model = model;
    
    [self.iamgeView sd_setImageWithURL:[NSURL URLWithString:model.newsImage]];
    self.TitleLabel.text = model.newsTitle;
    self.SourceLabel.text = model.newsSource;
    self.TypeLabel.text = model.newsType;
    

}

-(void)setFrame:(CGRect)frame{
    
    //    frame.origin.x = 5;
    frame.origin.y += 2;
    //    frame.size.width -= 2 *5;
    frame.size.height -= 2;
    [super setFrame:frame];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
