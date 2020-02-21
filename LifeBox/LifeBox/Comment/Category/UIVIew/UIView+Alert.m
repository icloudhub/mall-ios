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


+ (void)ug_debugmsg:(NSString*)msg
{
#if DEBUG
    NSString *str = [NSString stringWithFormat:@"%@",msg];
    UIWindow *awindow = [UIApplication sharedApplication].keyWindow;
    [awindow ug_msg:str];
#endif
}
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

- (void)ug_loading {
    dispatch_main_async_safe(^{
        
        MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
        ///防止重复创建引起界面闪烁
        if (hud == nil) {
            hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.label.text = @"Loading...";
            hud.animationType = MBProgressHUDAnimationFade;
            hud.removeFromSuperViewOnHide = YES;
        }
    });
}

+ (void)ug_loading{
    UIWindow *awindow = [UIApplication sharedApplication].keyWindow;
    [awindow ug_loading];
}


+ (void)ug_hiddenLoading{
    UIWindow *awindow = [UIApplication sharedApplication].keyWindow;
    [awindow ug_hiddenLoading];
}


- (void)ug_hiddenLoading {
    dispatch_main_async_safe(^{
        [MBProgressHUD hideHUDForView:self animated:YES];
    });
}

@end
