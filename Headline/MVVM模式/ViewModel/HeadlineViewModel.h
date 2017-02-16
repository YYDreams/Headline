//
//  HeadlineViewModel.h
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeadlineViewModel : NSObject
- (void)handleDataWithSuccess:(void(^)(NSArray *arr))success failure:(void(^)(NSError *error))failure;
@end
