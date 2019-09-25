//
//  UIView+Loading.h
//  BattBox
//
//  Created by Lucky on 2018/12/4.
//  Copyright © 2018 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Loading)

#pragma mark - 显示Loading框
- (void)showLoading;

#pragma mark - 隐藏Loading框
- (void)hiddenLoading;

@end

NS_ASSUME_NONNULL_END
