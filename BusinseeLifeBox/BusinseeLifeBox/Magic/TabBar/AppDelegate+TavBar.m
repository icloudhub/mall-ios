//
//  AppDelegate+TavBar.m
//  UbunGit_OC
//
//  Created by admin on 2019/3/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "AppDelegate+TavBar.h"
#import "HomeViewController.h"
#import "DanmuViewController.h"
#import "SuperNavigationController.h"


@implementation UIApplication (TavBar)

-(void)configTabBar{
    
    HomeViewController *vc1 = [HomeViewController new];
    vc1.title = @"首页";
    SuperNavigationController *nav1 = [[SuperNavigationController alloc] initWithRootViewController:vc1];
    [nav1.tabBarItem setImage:[UIImage imageWithIcon:@"fa-home" backgroundColor:[UIColor clearColor] iconColor:COLOR_DEF andSize:CGSizeMake(20, 20)]];
  
   
    
    
    // 视图控制器的分栏按钮
    // 视图控制器的分栏按钮，如果没有被显示创建，并且被使用了，则会自动根据视图控制器的title来创建
    //vc1.tabBarItem;
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.title = @"消息";
    SuperNavigationController *nav2 = [[SuperNavigationController alloc] initWithRootViewController:vc2];
    [nav2.tabBarItem setImage:[UIImage imageWithIcon:@"fa-heart" backgroundColor:[UIColor clearColor] iconColor:COLOR_DEF andSize:CGSizeMake(20, 20)]];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.title = @"出门单";
    SuperNavigationController *nav3 = [[SuperNavigationController alloc] initWithRootViewController:vc3];
    [nav3.tabBarItem setImage:[UIImage imageWithIcon:@"fa-th-large" backgroundColor:[UIColor clearColor] iconColor:COLOR_DEF andSize:CGSizeMake(20, 20)]];
    
    SettingViewController *vc4 = [[SettingViewController alloc] init];
    vc4.title = @"设置";
    SuperNavigationController *nav4 = [[SuperNavigationController alloc] initWithRootViewController:vc4];
    [nav4.tabBarItem setImage:[UIImage imageWithIcon:@"fa-cog" backgroundColor:[UIColor clearColor] iconColor:COLOR_DEF andSize:CGSizeMake(20, 20)]];

    
    // 创建分栏(标签栏)控制器, 和导航控制器一样，都是用来管理视图控制器的容器类型的控制器。
    // 分栏控制器和导航控制器一样，也是通过viewControllers来管理其子视图控制器
    UITabBarController *tabBarCtrl = [[UITabBarController alloc] init];
    // 把数据中得视图器交给分栏控制器管理
    // 分栏控制器会自动将其管理的视图控制器的分栏按钮(UITabBarItem)放到分栏上显示
    tabBarCtrl.viewControllers = @[nav1, nav2, nav3,nav4];
    
    // 设置窗口的跟视图控制器为分栏控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarCtrl;
    
    // 取到分栏控制器的分栏
    UITabBar *tabBar = tabBarCtrl.tabBar;
    
    // 设置分栏的风格
    tabBar.barStyle = UIBarStyleDefault;
    
    // 是否透明
    tabBar.translucent = NO;
    
    // 设置分栏的前景颜色
    tabBar.barTintColor =[UIColor whiteColor]; ;
    
    // 设置分栏元素项的颜色
    tabBar.tintColor = [UIColor ug_random];

    tabBarCtrl.tabBar.tintColor = COLOR_DEF;
 
    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
}
@end
