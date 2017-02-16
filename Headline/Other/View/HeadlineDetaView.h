//
//  HeadlineDetaView.h
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadlineDetaView : UIView
@property(nonatomic,copy)NSString *urlString;
@property(nonatomic,weak)UIWebView *webView;
@end
