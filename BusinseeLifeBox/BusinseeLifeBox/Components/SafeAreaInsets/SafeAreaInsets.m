//
//  SafeAreaInsets.m
//  LifeBox
//
//  Created by Lucky on 2019/8/21.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "SafeAreaInsets.h"

@implementation SafeAreaInsets

/**
 获取安全顶部距离
 @return 安全距离
 */
+ (CGFloat)getSafeTop {
    if (@available(iOS 11.0, *)) {
        return [UIApplication sharedApplication].keyWindow.safeAreaInsets.top;
    } else {
        return 0.0;
    }
    return 0.0;
}

/**
 获取安全底部距离
 @return 安全距离
 */
+ (CGFloat)getSafeBottom {
    if (@available(iOS 11.0, *)) {
        return [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
    } else {
        return 0.0;
    }
    return 0.0;
}

@end
