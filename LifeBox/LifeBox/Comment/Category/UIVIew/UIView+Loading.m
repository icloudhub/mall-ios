//
//  UIView+Loading.m
//  BattBox
//
//  Created by Lucky on 2018/12/4.
//  Copyright © 2018 Lucky. All rights reserved.
//

#import "UIView+Loading.h"
#import "MBProgressHUD.h"

@implementation UIView (Loading)

#pragma mark - 显示Loading框
- (void)showLoading {
    dispatch_main_async_safe(^{
//        YYImage *image = [YYImage imageNamed:@"loadingImg.gif"];
//        YYAnimatedImageView *imageview = [[YYAnimatedImageView alloc] initWithImage:image];
        MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
        ///防止重复创建引起界面闪烁
        if (hud == nil) {
            hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.label.text = @"Loading...";
            hud.animationType = MBProgressHUDAnimationFade;
            hud.removeFromSuperViewOnHide = YES;
        }
        /*
         
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = Localized(@"PUBLIC_LOADING");
        hud.animationType = MBProgressHUDAnimationFade;
        hud.removeFromSuperViewOnHide = YES;
        
        */
        
//        hud.customView = imageview;
//        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
//        hud.bezelView.backgroundColor = [UIColor clearColor];
    });
}

#pragma mark - 隐藏Loading框
- (void)hiddenLoading {
    dispatch_main_async_safe(^{
        [MBProgressHUD hideHUDForView:self animated:YES];
    });
}

@end
