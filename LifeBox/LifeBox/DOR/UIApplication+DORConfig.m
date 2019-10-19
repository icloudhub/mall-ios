//
//  UIApplication+DORConfig.m
//  LifeBox
//
//  Created by admin on 2019/8/11.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "UIApplication+DORConfig.h"
#ifdef DEBUG
#import <DoraemonKit/DoraemonManager.h>
#import <DoraemonKit/DoraemonUtil.h>

@implementation UIApplication (DORConfig)

-(void)configDor{
   

    [[DoraemonManager shareInstance] install];
    //功能测试
    
     [[DoraemonManager shareInstance] addPluginWithTitle:@"登陆" icon:@"doraemon_ui" desc:@"登陆" pluginName:@"DorLoginViewController" atModule:@"功能测试"];
    
     [[DoraemonManager shareInstance] addPluginWithTitle:@"注册" icon:@"doraemon_ui" desc:@"注册" pluginName:@"DorRegisterViewController" atModule:@"功能测试"];
    
     [[DoraemonManager shareInstance] addPluginWithTitle:@"商品详情" icon:@"doraemon_ui" desc:@"商品详情" pluginName:@"DorGoodsDefViewController" atModule:@"功能测试"];
    
     [[DoraemonManager shareInstance] addPluginWithTitle:@"app配置" icon:@"doraemon_ui" desc:@"商品详情" pluginName:@"DorConfigController" atModule:@"功能测试"];
    
    [[DoraemonManager shareInstance] addPluginWithTitle:@"弹框" icon:@"doraemon_ui" desc:@"弹框" pluginName:@"DorAlert" atModule:@"功能测试"];
    
    //接口测试
    [[DoraemonManager shareInstance] addPluginWithTitle:@"接口测试" icon:@"doraemon_ui" desc:@"接口测试" pluginName:@"DorSwagger" atModule:@"接口测试"];
    [[DoraemonManager shareInstance] addPluginWithTitle:@"搜索接口测试" icon:@"doraemon_ui" desc:@"搜索接口测试" pluginName:@"DorSearchSwagger" atModule:@"接口测试"];

}
@end

//弹框测试
#import "DorViewAlertVC.h"
@implementation DorAlert

- (void)pluginDidLoad{
    
    DorViewAlertVC *vc = [[DorViewAlertVC alloc] init];
    [DoraemonUtil openPlugin:vc];
}

@end
#import "DoraemonDefaultWebViewController.h"
@implementation DorSwagger

- (void)pluginDidLoad{
  
    DoraemonDefaultWebViewController *vc = [[DoraemonDefaultWebViewController alloc] init];
    vc.h5Url = [NSString stringWithFormat:@"%@/swagger-ui.html",BASEURL];
    [DoraemonUtil openPlugin:vc];
}

@end
@implementation DorSearchSwagger

- (void)pluginDidLoad{
    
    DoraemonDefaultWebViewController *vc = [[DoraemonDefaultWebViewController alloc] init];
    vc.h5Url = [NSString stringWithFormat:@"%@/swagger-ui.html",SEARCHURL];
    [DoraemonUtil openPlugin:vc];
}

@end


#import "LoginViewController.h"
@implementation DorLoginViewController

- (void)pluginDidLoad{
    
    LoginViewController *vc = [[LoginViewController alloc] init];
    [DoraemonUtil openPlugin:vc];
}

@end

#pragma mark 注册
@implementation DorRegisterViewController

- (void)pluginDidLoad{
    
    UIViewController *vc = [NSClassFromString(@"RegisterViewController") new];
    [DoraemonUtil openPlugin:vc];
}

@end



#import "GoodsDefViewController.h"
@implementation DorGoodsDefViewController

- (void)pluginDidLoad{
    
    GoodsDefViewController *vc = [[GoodsDefViewController alloc] init];
    [DoraemonUtil openPlugin:vc];
}

@end


#import "ConfigData.h"
@implementation DorConfigController

- (void)pluginDidLoad{
    [[ConfigData shared] updateConfigGlobal:^(NSError * _Nonnull error) {
        ;
    }];
//    [[DoraemonManager shareInstance] hiddenHomeWindow];
}

@end

#endif
