//
//  UIApplication+Initialize.m
//  LifeBox
//
//  Created by Lucky on 2019/8/3.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "UIApplication+Initialize.h"
#import "MyTabBarController.h"

@implementation UIApplication (Initialize)

#pragma mark - 创建主界面
+ (void)markWindownRootVC {
    UIWindow *awindow = [[UIApplication sharedApplication] keyWindow];
    if(!awindow){
        awindow = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    }
    RTRootNavigationController *mainVC = [[RTRootNavigationController alloc] initWithRootViewController:[[MyTabBarController alloc] init]];
    awindow.rootViewController = mainVC;
}

@end
