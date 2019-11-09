//
//  UIButton+UG.h
//  LHCloud
//
//  Created by admin on 2019/5/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger) {
    TOP     = 0, // 上
    LEFT    = 1, // 左
    BOTTOM  = 2, // 下
    RIGHT   = 3  // 右
}UG_Alignment;


@interface UIButton (UG)

@property (nonatomic, assign) NSTimeInterval ug_eventInterval;//button 点击间隔时间

/**
 * button 图片赋值/图片名称必须规范
 *  imagestr_Normal
 *  imagestr_Highlighted
 *  imagestr_Disabled
 *  imagestr_Selected
 *  imagestr_Focused
 *  imagestr_Application
 *  imagestr_Reserved
 */
-(void)ug_setImage:(NSString *)imagestr;

-(void)ug_alignment:(UG_Alignment)alignment;
@end

NS_ASSUME_NONNULL_END
