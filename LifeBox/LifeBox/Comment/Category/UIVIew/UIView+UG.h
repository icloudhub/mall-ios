//
//  UIView+UG.h
//  Nextcloud
//
//  Created by admin on 2019/3/12.
//  Copyright © 2019 TWS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (UG)

/**
 * 设置圆角
 */
- (void)ug_Radius:(CGFloat)radius;

/**
 * 
 */
-(void)ug_border:(UIColor*)color white:(CGFloat)width;


/**
 * 添加阴影
 */
-(void)ug_shadowColor:(UIColor *)acolor width:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
