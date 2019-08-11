//
//  MyTabBarController.m
//  LifeBox
//
//  Created by Lucky on 2019/8/6.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomeViewController.h"
#import "ShoppingCartController.h"
#import "MyViewController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - 创建TabBar
- (void)createTabBar {
    /*
     * 首页
     */
    HomeViewController *homeCtl = [[HomeViewController alloc] init];
    RTRootNavigationController *rtNav0 = [[RTRootNavigationController alloc] initWithRootViewController:homeCtl];
    rtNav0.tabBarItem.title = @"首页";
    [rtNav0.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [rtNav0.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGBColor(211, 47, 47), NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    UIImage *homeImg = [UIImage imageNamed:@"homeTabBarImg"];
    homeImg = [homeImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [rtNav0.tabBarItem setImage:homeImg];
    UIImage *homeSelectImg = [UIImage imageNamed:@"homeTabBarSelected"];
    homeSelectImg = [homeSelectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [rtNav0.tabBarItem setSelectedImage:homeSelectImg];
    /*
     * 购物车
     */
    ShoppingCartController *shoppingCtl = [[ShoppingCartController alloc] init];
    RTRootNavigationController *rtNav1 = [[RTRootNavigationController alloc] initWithRootViewController:shoppingCtl];
    rtNav1.tabBarItem.title = @"购物车";
    [rtNav1.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [rtNav1.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGBColor(211, 47, 47), NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    UIImage *shopImg = [UIImage imageNamed:@"workTabBarImg"];
    shopImg = [shopImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [rtNav1.tabBarItem setImage:shopImg];
    UIImage *shopSelectImg = [UIImage imageNamed:@"workTabBarSelected"];
    shopSelectImg = [shopSelectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [rtNav1.tabBarItem setSelectedImage:shopSelectImg];
    /*
     * 个人中心
     */
    MyViewController *myCtl = [[MyViewController alloc] init];
    RTRootNavigationController *rtNav2 = [[RTRootNavigationController alloc] initWithRootViewController:myCtl];
    rtNav2.tabBarItem.title = @"我的";
    [rtNav2.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [rtNav2.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGBColor(211, 47, 47), NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    UIImage *myImg = [UIImage imageNamed:@"personTabBarImg"];
    myImg = [myImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [rtNav2.tabBarItem setImage:myImg];
    UIImage *mySelectImg = [UIImage imageNamed:@"personTabBarSelected"];
    mySelectImg = [mySelectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [rtNav2.tabBarItem setSelectedImage:mySelectImg];
    NSArray *ctlArr = [NSArray arrayWithObjects:rtNav0, rtNav1, rtNav2, nil];
    self.viewControllers = ctlArr;
}

@end
