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
    [[DoraemonManager shareInstance] addPluginWithTitle:@"弹框" icon:@"doraemon_ui" desc:@"弹框" pluginName:@"DorAlert" atModule:@"功能测试"];
}
@end

#import "DorViewAlertVC.h"
@implementation DorAlert

- (void)pluginDidLoad{
    
    DorViewAlertVC *vc = [[DorViewAlertVC alloc] init];
    [DoraemonUtil openPlugin:vc];
    
}

@end


#endif
