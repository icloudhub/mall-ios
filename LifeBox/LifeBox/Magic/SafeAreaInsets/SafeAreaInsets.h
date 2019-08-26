//
//  SafeAreaInsets.h
//  LifeBox
//
//  Created by Lucky on 2019/8/21.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SafeAreaInsets : NSObject

/**
 获取安全顶部距离
 @return 安全距离
 */
+ (CGFloat)getSafeTop;

/**
 获取安全底部距离
 @return 安全距离
 */
+ (CGFloat)getSafeBottom;

@end

NS_ASSUME_NONNULL_END
