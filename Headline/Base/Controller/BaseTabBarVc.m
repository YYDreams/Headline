//
//  BaseTabBarVc.m
//  Headline
//
//  Created by 花花 on 2017/2/16.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "BaseTabBarVc.h"
#import "BaseNavVc.h"
@interface BaseTabBarVc ()

@end

@implementation BaseTabBarVc

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAllChildControllers];
}

#pragma mark - setupAllControlls
- (void)setupAllChildControllers{
    
    NSArray *ControllerViews = @[@"HeadlineVc",@"HeadlineVc1",@"HeadlineVc2"];

    NSArray *normalImageNames = @[@"index_nor", @"index_nor", @"index_nor"];

    NSArray *selectImageNames = @[@"index_sel", @"index_sel", @"index_sel"];
    
    NSArray *titles = @[@"MVC模式",@"MVVM模式",@"MVVC模式"];
    for (int i = 0; i< ControllerViews.count; i++) {
        
        
        NSString *className= ControllerViews[i];
        
        Class class = NSClassFromString(className);
        
        UIViewController *VC  = [class new];
        self.tabBar.tintColor  = [UIColor redColor];
        
        VC.title = titles[i];
        VC.tabBarItem.image = [[UIImage imageNamed:normalImageNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        VC.tabBarItem.selectedImage =  [[UIImage imageNamed:selectImageNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        BaseNavVc *Nav = [[BaseNavVc alloc]initWithRootViewController:VC];
        Nav.navigationBar.translucent = NO; //设置
        [self addChildViewController:Nav];
        
    }

    self.selectedIndex = 1;
    
}

@end
