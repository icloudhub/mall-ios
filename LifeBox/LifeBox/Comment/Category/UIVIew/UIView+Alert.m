//
//  UIView+Alert.m
//  LifeBox
//
//  Created by admin on 2019/8/12.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "UIView+Alert.h"
#import "MBProgressHUD.h"
@implementation UIView (Alert)



+ (void)ug_msg:(NSString*)msg
{
    UIWindow *awindow = [UIApplication sharedApplication].keyWindow;
    [awindow ug_msg:msg];
}

-(void)ug_msg:(NSString*)msg{
   
    dispatch_main_async_safe(^{
        [MBProgressHUD hideHUDForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.detailsLabel.font = [UIFont systemFontOfSize:13];
        hud.detailsLabel.text = msg;
        hud.contentColor = [UIColor whiteColor];
        hud.mode = MBProgressHUDModeCustomView;
        hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1];
        hud.offset = CGPointMake(0.f, 0.f);
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        hud.margin = 12;
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES afterDelay:2];
    });
}

@end
