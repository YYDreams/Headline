//
//  HTTPRequest.h
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import <Foundation/Foundation.h>
//请求成功回调
typedef void(^RequestSuccessCallBack)(id resposeObject);
//请求失败回调
typedef void(^RequestErrorCallBack)(NSError *error);

@interface HTTPRequest : NSObject
/**
 *  GET请求
 *  @param urlString url地址
 *  @param parameter 参数
 *  @param success   成功回调
 *  @param failure   失败回调
 */
+(void)GET:(NSString *)urlString parameter:(NSDictionary *)parameter success:(RequestSuccessCallBack)success failure:(RequestErrorCallBack)failure;

/**
 *  POST请求
 *  @param urlString url地址
 *  @param parameter 参数
 *  @param success   成功回调
 *  @param failure   失败回调
 *  @return NSURLSessionDataTask
 */
+(NSURLSessionDataTask *)POST:(NSString *)urlString parameter:(NSDictionary *)parameter success:(RequestSuccessCallBack)success failure:(RequestErrorCallBack)failure;
@end
