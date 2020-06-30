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
#import <DoraemonKit/DoraemonHomeWindow.h>


@implementation UIApplication (DORConfig)

-(void)configDor{
   

    [[DoraemonManager shareInstance] install];
    //功能测试
    
     [[DoraemonManager shareInstance] addPluginWithTitle:@"登陆" icon:@"doraemon_ui" desc:@"登陆" pluginName:@"DorLoginViewController" atModule:@"功能测试"];
    [[DoraemonManager shareInstance] addPluginWithTitle:@"注册" icon:@"doraemon_ui" desc:@"注册" pluginName:@"DorRegisterViewController" atModule:@"功能测试"];
    
     [[DoraemonManager shareInstance] addPluginWithTitle:@"商品详情" icon:@"doraemon_ui" desc:@"商品详情" pluginName:@"DorGoodsDefViewController" atModule:@"功能测试"];
    
     [[DoraemonManager shareInstance] addPluginWithTitle:@"app配置" icon:@"doraemon_ui" desc:@"商品详情" pluginName:@"DorConfigController" atModule:@"功能测试"];
    
    [[DoraemonManager shareInstance] addPluginWithTitle:@"商品分类" icon:@"doraemon_ui" desc:@"商品分类" pluginName:@"DorGoodsClassesVC" atModule:@"功能测试"];
    
    [[DoraemonManager shareInstance] addPluginWithTitle:@"弹框" icon:@"doraemon_ui" desc:@"弹框" pluginName:@"DorAlert" atModule:@"功能测试"];
    
    [[DoraemonManager shareInstance] addPluginWithTitle:@"售后列表" icon:@"doraemon_ui" desc:@"售后列表" pluginName:@"" atModule:@"功能测试" handle:^(NSDictionary * _Nonnull itemData) {
        Class cls = NSClassFromString(@"AfterSalesListVC");
        UIViewController *viewcontroller =  [cls new];
        [DoraemonHomeWindow openPlugin:viewcontroller];
    }];
    [[DoraemonManager shareInstance] addPluginWithTitle:@"商家" icon:@"doraemon_ui" desc:@"商家" pluginName:@"" atModule:@"商家" handle:^(NSDictionary * _Nonnull itemData) {
        Class cls = NSClassFromString(@"UGBox.WKwebViewController");
        UIViewController *viewcontroller =  [cls new];
        [viewcontroller setValue:[NSString stringWithFormat:@"%@:15676",[[Global_Variable shared] serviceIP]] forKey:@"url"];
        [DoraemonHomeWindow openPlugin:viewcontroller];
    }];

    //接口测试
    [[DoraemonManager shareInstance] addPluginWithTitle:@"接口配置" icon:@"doraemon_ui" desc:@"接口配置" pluginName:@"DorConfigServiceproVC" atModule:@"接口测试"];
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
  
    NSString *h5uel = [NSString stringWithFormat:@"%@/swagger-ui.html",BASEURL];
    UIViewController *vc = [NSClassFromString(@"DoraemonDefaultWebViewController") new];
    [vc setValue:h5uel forKey:@"h5Url"];
//    UIViewController *vc = [NSClassFromString(@"DoraemonDefaultWebViewController") new];
//    vc.h5Url =
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


@implementation DorLoginViewController

- (void)pluginDidLoad{

    UIViewController *vc = [NSClassFromString(@"LoginViewController") new];
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

#import "DorConfigServiceVC.h"
@implementation DorConfigServiceproVC

- (void)pluginDidLoad{
   DorConfigServiceVC *vc = [[DorConfigServiceVC alloc] init];
    [DoraemonUtil openPlugin:vc];
}

@end

#import "GoodsClassesVC.h"
@implementation DorGoodsClassesVC

- (void)pluginDidLoad{
   GoodsClassesVC *vc = [[GoodsClassesVC alloc] init];
    [DoraemonUtil openPlugin:vc];
}

@end





#endif
