//
//  GenException.h
//  BattBox
//
//  Created by Lucky on 2018/11/29.
//  Copyright © 2018 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

/*
 * 异常类型
 */
typedef enum {
    WARNING,
}Exception_LEVEL;

@interface GenException : NSObject

#pragma mark - 属性
///异常类型
@property (assign, nonatomic) Exception_LEVEL exLeveal;

///异常描述
@property (strong, nonatomic) NSString *describeStr;

///异常展示存放的父视图
@property (strong, nonatomic) UIView *exSuperView;

#pragma mark - 方法
/**
 初始化异常气泡
 @param msg 错误描述信息
 @param type 异常类型
 @param showView 需要展示的容器
 @return 返回实体
 */
+ (GenException *)exceptionViewAllocWithTitle:(NSString *)msg warningType:(Exception_LEVEL)type showView:(UIView * _Nullable )showView;


/**
 气泡显示
 */
- (void)showExceptionView;

@end

NS_ASSUME_NONNULL_END
