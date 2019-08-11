//
//  AppDelegate.m
//  LifeBox
//
//  Created by Lucky on 2019/8/2.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "SDWebImageManager.h"
#import "UIApplication+Initialize.h"
#import "Reachability.h"

#ifdef DEBUG
#import "UIApplication+DORConfig.h"
#endif
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UIApplication sharedApplication]configlog];
    // 启动图片延时: 1秒
    [NSThread sleepForTimeInterval:1];
    /*
     * 初始化KeyWindow
     */
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    /*
     * 初始化键盘控制器
     */
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager];
    //控制整个功能是否启用
    keyboardManager.enable = YES;
    //控制点击背景是否收起键盘
    keyboardManager.shouldResignOnTouchOutside = YES;
    /*
     * 图片请求最大缓存
     */
    [[SDWebImageManager sharedManager].imageCache setMaxMemoryCost:20480];
    /*
     * 开启网络状况的监听
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    [reach startNotifier];
    /*
     * 判断是否第一次启动
     */
    NSString *isFirst = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstApp"];
//    if ([isFirst isEqualToString:@""] || isFirst == nil || isFirst.length == 0) {
//        GuideViewController *viewcon = [[GuideViewController alloc]init];
//        self.window.rootViewController = viewcon;
//    }else{
//        [UIApplication markWindownRootVC];
//    }
    [UIApplication markWindownRootVC];
    #ifdef DEBUG
        [[UIApplication sharedApplication] configDor];
    #endif
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 网络状态监听
-(void)reachabilityChanged:(NSNotification *)note{
    Reachability *currReach = [note object];
    NSParameterAssert([currReach isKindOfClass:[Reachability class]]);
    //对连接改变做出响应处理动作
    NetworkStatus status = [currReach currentReachabilityStatus];
    if (status == NotReachable) {
        //如果没有连接到网络就弹出提醒实况
//        [AlertManager alertShowOneBtnWithTitle:Localized(@"PUBLIC_NOTICE") message:Localized(@"PUBLIC_NETWORK") cancelTitle:nil sureTitle:Localized(@"PUBLIC_SURE") block:^{
//            
//        }];
    }
}

@end
