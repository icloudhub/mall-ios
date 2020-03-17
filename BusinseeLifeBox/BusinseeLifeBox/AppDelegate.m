//
//  AppDelegate.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/16.
//  Copyright © 2020 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Welcom.h"
#import "UIApplication+Timer.h"
#import "AppDelegate+DoraemonKit.h"

#import "UserInfo.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];

    //配置DoraemonKit 测试工具
    [self configDoraemonKit];
    //配置CocoaLumberjack 日志
    [self configCocoaLumberjack];
    //全局定时器
    [[UIApplication sharedApplication] startGloableTimer];

    [[UIApplication sharedApplication]configTABAnimated];
    
    [self configRTRootNavigationController];
    if([UserInfo share].islogin){
        //配置tabbar
         [self configTabBar];
    }else{
        Class cls = NSClassFromString(@"LoginViewController");
        UIViewController *viewcontroller =  [cls new];
        RTRootNavigationController *nav = [[RTRootNavigationController alloc] initWithRootViewController:viewcontroller];
        self.window.rootViewController = nav;
        [self.window makeKeyAndVisible];
    }
 
    //配置网易云信
//    [self configNIMSDK];
    
    //配置广告页
    //    [self configDMViewController:^(UIButton * _Nullable sender) {
    //        //配置欢迎页
    //        [self configWelcom:^(UIButton * _Nullable sender) {
    //            //配置tabbar
    //            [self configTabBar];
    //        }];
    //    }];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

/*
* 后台挂起
*/
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

/*
* App唤醒方法
*/
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 网络状态监听
-(void)reachabilityChanged:(NSNotification *)note{

}

@end
