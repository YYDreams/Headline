//
//  HeadlineDetaView.m
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "HeadlineDetaView.h"


@interface HeadlineDetaView ()<UIWebViewDelegate>


@end


@implementation HeadlineDetaView

#pragma mark - Setter&Getter

-(UIWebView *)webView{
    if (!_webView) {
        UIWebView *webView = [[UIWebView alloc]initWithFrame:self.bounds];
        
        webView.delegate = self;
        [self addSubview:webView];
        _webView  = webView;
        
    }
    
    return _webView;
    
}



-(void)setUrlString:(NSString *)urlString{
    
    
    _urlString = urlString;
    
    
    [self pressentWebWithURL];//webview显示URL内容
    
}

- (void)pressentWebWithURL{
    
    NSURL *url = [NSURL URLWithString:self.urlString];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"DidFaiLoadWithError: %@", error);
}

@end


