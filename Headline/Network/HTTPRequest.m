//
//  HTTPRequest.m
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "HTTPRequest.h"
#import "AFNetworking.h"
@implementation HTTPRequest
/**
 *  GET请求
 *  @param urlString url地址
 *  @param parameter 参数
 *  @param success   成功回调
 *  @param failure   失败回调
 */
+(void)GET:(NSString *)urlString parameter:(NSDictionary *)parameter success:(RequestSuccessCallBack)success failure:(RequestErrorCallBack)failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
/**
 *  POST请求
 *  @param urlString url地址
 *  @param parameter 参数
 *  @param success   成功回调
 *  @param failure   失败回调
 *  @return NSURLSessionDataTask
 */
+(NSURLSessionDataTask *)POST:(NSString *)urlString parameter:(NSDictionary *)parameter success:(RequestSuccessCallBack)success failure:(RequestErrorCallBack)failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLSessionDataTask *dataTask = [manager POST:urlString parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    return dataTask;
}

@end
