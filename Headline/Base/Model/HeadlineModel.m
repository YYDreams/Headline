//
//  HeadlineModel.m
//  Headline
//
//  Created by 花花 on 2017/2/14.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "HeadlineModel.h"

@implementation HeadlineModel

-(instancetype)initWithDic:(NSDictionary*)dic{
    
    if (self = [super init ]) {
        
        
        
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
    
}

- (id)valueForUndefinedKey:(NSString *)key{
    
    return nil;
}

@end
