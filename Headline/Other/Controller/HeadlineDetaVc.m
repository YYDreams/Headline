//
//  HeadlineDetaVc.m
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "HeadlineDetaVc.h"
#import "HeadlineDetaView.h"
@interface HeadlineDetaVc ()<UIWebViewDelegate>

@property (nonatomic,strong) HeadlineDetaView *headlineDetaView;
@end

@implementation HeadlineDetaVc

- (instancetype)initWithNavTitle:(NSString *)navTitle urlStr:(NSString *)urlStr{

    if (self == [super init]) {
        
        self.navTitle = [navTitle copy];
        self.urlStr = [urlStr copy];
    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.navTitle;
    
    [self.view addSubview:self.headlineDetaView];
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    

}
- (HeadlineDetaView *)headlineDetaView{
    if (!_headlineDetaView) {
        _headlineDetaView=[[HeadlineDetaView alloc]initWithFrame:self.view.bounds];
       
        NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]];
        [_headlineDetaView.webView loadRequest:request];
    }
    return _headlineDetaView;
}

#pragma mark - UIWebView delegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

@end
