//
//  UIView+Alert.h
//  LifeBox
//
//  Created by admin on 2019/8/12.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Alert)

/**
 * 小提示 在window上弹出
 */
+ (void)ug_msg:(NSString*)title;

/**
 * 小提示 在view上弹出
 */
-(void)ug_msg:(NSString*)title;

- (void)ug_loading;
+ (void)ug_loading;

- (void)ug_hiddenLoading;
+ (void)ug_hiddenLoading;

@end

NS_ASSUME_NONNULL_END
