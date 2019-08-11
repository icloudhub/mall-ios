//
//  GenException.m
//  BattBox
//
//  Created by Lucky on 2018/11/29.
//  Copyright © 2018 Lucky. All rights reserved.
//

#import "GenException.h"

@implementation GenException

#pragma mark - 初始化异常气泡
/**
 初始化异常气泡
 @param msg 错误描述信息
 @param type 异常类型
 @param showView 需要展示的容器
 @return 返回实体
 */
+ (GenException *)exceptionViewAllocWithTitle:(NSString *)msg warningType:(Exception_LEVEL)type showView:(UIView * _Nullable )showView {
    GenException *genEx = [[GenException alloc] init];
    /*
     * 错误描述处理
     */
    if (!msg) {
        msg = @"未定义的错误描述";
    }
    genEx.describeStr = msg;
    /*
     * 类型处理
     */
    if (!type) {
        type = WARNING;
    }
    genEx.exLeveal = type;
    /*
     * 存储视图处理
     */
    if (!showView) {
        showView = [UIApplication sharedApplication].keyWindow;
    }
    genEx.exSuperView = showView;
    return genEx;
}

#pragma mark - 展示气泡
- (void)showExceptionView {
    /*
     * 类型判断
     */
    switch (_exLeveal) {
        case WARNING: {
            /*
             * 确保错误气泡展示在主线程执行
             */
            dispatch_main_async_safe(^{
                [MBProgressHUD hideHUDForView:self.exSuperView animated:YES];
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.exSuperView animated:YES];
                hud.detailsLabel.font = [UIFont systemFontOfSize:13];
                hud.detailsLabel.text = self.describeStr;
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
            break;
        default:
            break;
    }
}



@end
